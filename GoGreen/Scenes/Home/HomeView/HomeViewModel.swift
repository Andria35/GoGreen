//
//  HomeViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import Foundation
import NetworkManager

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    let networkManager: APIServices
    @Published var textfieldText: String = ""
    @Published var plantFamilies: PlantFamilies = PlantFamilies(roses: [], sunflowers: [], jasmines: [], daisies: [], irises: [])
    @Published var searchResult: [Plant] = []
    
    // MARK: - FamilyOfPlants
    enum FamilyOfPlants: String {
        case rose
        case sunflower
        case jasmine
        case daisy
        case iris
    }
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        Task {
            await fetchPlantFamilies()
        }
    }
    
    // MARK: - Methods
    func plantsFamilyIsEmpty() -> Bool {
        if plantFamilies.daisies.isEmpty && plantFamilies.roses.isEmpty && plantFamilies.irises.isEmpty && plantFamilies.jasmines.isEmpty && plantFamilies.sunflowers.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - API Calls
    private func fetchPlants(by parameter: String) async throws -> [Plant] {
        let apiKey = "oeFJyqfUxBwv_s2Pg_DmjFCFVHZ53xsrbhPRPqi8YBc"
        let urlString = "https://trefle.io/api/v1/plants/search?q=\(parameter)&token=\(apiKey)"
        do {
            let plantsResponse: PlantsResponse = try await networkManager.fetchData(fromURL: urlString)
            return plantsResponse.data
        } catch {
            throw error
        }
    }
    
    func fetchPlantsByTextfieldResult() {
        Task {
            do {
                let plants = try await fetchPlants(by: textfieldText)
                await MainActor.run {
                    self.searchResult = plants
                }
            } catch {
                print(error)
            }
        }
    }
    
    private func fetchPlantsByFamily(familyOfPlants: FamilyOfPlants ) async throws -> [Plant] {
        do {
            return try await fetchPlants(by: familyOfPlants.rawValue)
        } catch {
            throw error
        }
    }
    
    private func fetchPlantFamilies() async {
        async let fetchRoses = fetchPlantsByFamily(familyOfPlants: .rose)
        async let fetchSunflowers = fetchPlantsByFamily(familyOfPlants: .sunflower)
        async let fetchJasmines = fetchPlantsByFamily(familyOfPlants: .jasmine)
        async let fetchDaisies = fetchPlantsByFamily(familyOfPlants: .daisy)
        async let fetchIrises = fetchPlantsByFamily(familyOfPlants: .iris)
        
        let (roses, sunflowers, jasmines, daisies, irises) = await (try? fetchRoses, try? fetchSunflowers, try? fetchJasmines, try? fetchDaisies, try? fetchIrises)
        await MainActor.run {
            plantFamilies.roses = roses ?? []
            plantFamilies.sunflowers = sunflowers ?? []
            plantFamilies.jasmines = jasmines ?? []
            plantFamilies.daisies = daisies ?? []
            plantFamilies.irises = irises ?? []
        }
    }
}

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
    @Published var plantFamilies: PlantFamilies = PlantFamilies(roses: [], sunflowers: [], jasmines: [], daisies: [], irises: [])
    
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
    
    // MARK: - API Calls
    private func fetchPlants(familyOfPlants: FamilyOfPlants ) async throws -> [Plant] {
        let apiKey = "oeFJyqfUxBwv_s2Pg_DmjFCFVHZ53xsrbhPRPqi8YBc"
        let urlString = "https://trefle.io/api/v1/plants/search?q=\(familyOfPlants.rawValue)&token=\(apiKey)"
        do {
            let plantsResponse: PlantsResponse = try await networkManager.fetchData(fromURL: urlString)
            return plantsResponse.data
        } catch {
            throw error
        }
    }
    
    private func fetchPlantFamilies() async {
        async let fetchRoses = fetchPlants(familyOfPlants: .rose)
        async let fetchSunflowers = fetchPlants(familyOfPlants: .sunflower)
        async let fetchJasmines = fetchPlants(familyOfPlants: .jasmine)
        async let fetchDaisies = fetchPlants(familyOfPlants: .daisy)
        async let fetchIrises = fetchPlants(familyOfPlants: .iris)
        
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

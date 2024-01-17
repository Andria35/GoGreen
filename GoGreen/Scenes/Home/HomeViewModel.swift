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
    @Published var plants: [Plant] = []
    let networkManager: APIServices
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        
        Task {
            await fetchPlants()
            print(plants.count)
        }
    }
    
    // MARK: - API Calls
    private func fetchPlants() async {
        let apiKey = "sk-uJGW65a7e81bd87753815"
        let urlString = "https://perenual.com/api/species-list?key=\(apiKey)"
        do {
            let plantsResponse: PlantsResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                plants = plantsResponse.data
            }
        } catch {
            print(error)
        }
    }

}

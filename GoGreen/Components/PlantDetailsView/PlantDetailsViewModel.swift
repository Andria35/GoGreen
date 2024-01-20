//
//  PlantDetailsViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import SwiftUI
import NetworkManager

final class PlantDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    let id: Int
    let networkManager: APIServices
    @Published var plantImage = Image(systemName: "photo")
    @Published var plantDetails: PlantDetails?
    
    // MARK: - Initialization
    init(id: Int, networkManager: APIServices) {
        self.id = id
        self.networkManager = networkManager
        
        Task {
            await fetchPlantDetails()
            await fetchImage(urlString: plantDetails?.imageURL ?? "")
        }
    }
    
    // MARK: - API Calls
    private func fetchPlantDetails() async {
        let apiKey = "oeFJyqfUxBwv_s2Pg_DmjFCFVHZ53xsrbhPRPqi8YBc"
        let urlString = "https://trefle.io/api/v1/plants/\(id)?token=\(apiKey)"
        do {
            let plantDetailsResponse: PlantDetailsResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                plantDetails = plantDetailsResponse.data
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchImage(urlString: String) async{
        do {
            let image = try await networkManager.fetchImage(fromURL: urlString)
            await MainActor.run {
                plantImage =  Image(uiImage: image)
            }
        } catch {
            print(error)
        }
    }
}

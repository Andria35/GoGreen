//
//  PlantComponentViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import SwiftUI
import NetworkManager

final class PlantComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    let plant: Plant
    let networkManager: APIServices
    @Published var plantImage: Image = Image(systemName: "photo")
    
    // MARK: - Initialization
    init(plant: Plant, networkManager: APIServices) {
        self.plant = plant
        self.networkManager = networkManager
        
        Task {
            await fetchImage(urlString: plant.imageURL)
        }
    }
    
    
    // MARK: - Api Calls
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

//
//  PlantCareViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit
import NetworkManager

protocol PlantCareViewModelDelegate: AnyObject {
    func fetchCompleted(plantCareVideos: [PlantCareVideo])
}

final class PlantCareViewModel {
    
    // MARK: - Class Properties
    let networkManager: APIServices
    weak var delegate: PlantCareViewModelDelegate?
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
    }
    
    // MARK: - Life Cycles
    func viewDidLoad() {
        Task {
            await fetchPlantCareVideos()
        }
    }
        
    // MARK: - API Calls
    private func fetchPlantCareVideos() async {
        let apiKey = "AIzaSyBMrT1Q6q-Q0ZCuLDCTpuYpdfoSN20wCaw"
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=plant%20care&type=video&maxResults=20&key=\(apiKey)"
        do {
            let plantCareVideoResponse: PlantCareVideoResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                delegate?.fetchCompleted(plantCareVideos: plantCareVideoResponse.items)
            }
        } catch {
            print(error)
        }
    }    
}

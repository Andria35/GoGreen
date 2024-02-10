//
//  PlantCareVideoCollectionViewCellViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit
import NetworkManager

protocol PlantCareVideoCollectionViewCellViewModelDelegate: AnyObject {
    func fetchCompleted(image: UIImage)
}

final class PlantCareVideoCollectionViewCellViewModel {
    
    // MARK: - Class Properties
    weak var delegate: PlantCareVideoCollectionViewCellViewModelDelegate?
    let networkManager: APIServices
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
    }
    
    // MARK: - LifeCycles
    func cellDidLoad(thumbnailURL: String) {
        Task {
            await fetchVideoThumbnail(thumbnailURL: thumbnailURL)
        }
    }
    
    // MARK: - API Calls
    private func fetchVideoThumbnail(thumbnailURL: String) async {
        do {
            let image = try await networkManager.fetchImage(fromURL: thumbnailURL)
            await MainActor.run {
                delegate?.fetchCompleted(image: image)
            }
        } catch {
            print(error)
        }
    }
}

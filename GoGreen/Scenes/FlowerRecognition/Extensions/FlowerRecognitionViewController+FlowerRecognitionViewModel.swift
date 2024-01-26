//
//  FlowerRecognitionViewController+FlowerRecognitionViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit
import NetworkManager

// MARK: - FlowerRecognitionViewModelDelegate
extension FlowerRecognitionViewController: FlowerRecognitionViewModelDelegate {
    func displayFlowerRecognitionFailedAlert() {
        alertManager.displayAlert(message: "There was a problem recognising this image", buttonTitle: "Ok", vc: self)
    }
    
    func fetchCompleted(plant: Plant) {
        flowerDetailsHostingController.rootView = PlantDetailsView(viewModel: PlantDetailsViewModel(id: plant.id, networkManager: NetworkManager()))
    }
}

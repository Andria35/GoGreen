//
//  MyGardenViewController+AddNewMyPlantViewControllerDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 27.01.24.
//

import UIKit

// MARK: - AddNewMyPlantViewControllerDelegate
extension MyGardenViewController: AddNewMyPlantViewControllerDelegate {
    func saveTapped(myPlantName: String?, myPlantImage: UIImage?, myPlantDescription: String?, notificationRepeatDays: Double) {
        viewModel.saveMyPlantLocally(name: myPlantName, image: myPlantImage, description: myPlantDescription, notificationRepeatDays: notificationRepeatDays)
        tableView.reloadData()
    }
}

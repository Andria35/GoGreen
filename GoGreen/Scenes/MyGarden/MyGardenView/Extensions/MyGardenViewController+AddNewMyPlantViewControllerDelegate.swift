//
//  MyGardenViewController+AddNewMyPlantViewControllerDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 27.01.24.
//

import UIKit

// MARK: - AddNewMyPlantViewControllerDelegate
extension MyGardenViewController: AddNewMyPlantViewControllerDelegate {
    func saveTapped(name: String) {
        viewModel.addMyPlant(name: name)
        tableView.reloadData()
    }
}

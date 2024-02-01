//
//  MyGardenViewController+MyPlantDetailsViewControllerDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 31.01.24.
//

import Foundation

// MARK: - MyPlantDetailsViewControllerDelegate
extension MyGardenViewController: MyPlantDetailsViewControllerDelegate {
    func deletePressed(myPlantID: String) {
        viewModel.deleteMyPlantLocally(with: myPlantID)
    }
}
//
//  MyGardenViewController+MyGardenViewModelDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 27.01.24.
//

import UIKit

// MARK: - MyGardenViewModelDelegate
extension MyGardenViewController: MyGardenViewModelDelegate {
    func fetchComplete(myPlants: [MyPlant]) {
        self.myPlants = myPlants
        tableView.reloadData()
    }
}

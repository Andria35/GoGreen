//
//  MyGardenViewController+TableView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - TableView Datasource & Delegate
extension MyGardenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let myPlant = myPlants[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: MyPlantTableViewCell.cellID, for: indexPath)
        if let cell = cell as? MyPlantTableViewCell {
            cell.configure(name: myPlant.name ?? "", image: viewModel.getImageFromImagePath(imagePath: myPlant.plantID ?? ""))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myPlantDetailsViewController = MyPlantDetailsViewController(animationManager: AnimationManager())
        myPlantDetailsViewController.delegate = self
        let myPlant = myPlants[indexPath.row]
        myPlantDetailsViewController.configureMyPlant(name: myPlant.name, description: myPlant.plantDescription, id: myPlant.plantID, image: viewModel.getImageFromImagePath(imagePath: myPlant.plantID ?? ""))
        navigationController?.pushViewController(myPlantDetailsViewController, animated: true)
    }
}

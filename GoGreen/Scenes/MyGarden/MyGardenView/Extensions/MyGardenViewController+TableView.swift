//
//  MyGardenViewController+TableView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - TableView Datasource
extension MyGardenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let myPlant = myPlants[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: MyPlantTableViewCell.cellID, for: indexPath)
        if let cell = cell as? MyPlantTableViewCell {
            cell.configure(name: myPlant.name ?? "", image: viewModel.getImageFromImagePath(imagePath: myPlant.imagePath ?? ""))
        }
        return cell
    }
}

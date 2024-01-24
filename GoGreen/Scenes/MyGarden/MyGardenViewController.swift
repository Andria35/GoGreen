//
//  MyGardenViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit

final class MyGardenViewController: UIViewController {

    // MARK: - Class Properties
    private var myPlants: [MyPlant] = [MyPlant(name: "Ficus", image: UIImage(systemName: "photo")!),MyPlant(name: "Ficusss", image: UIImage(systemName: "photo")!),MyPlant(name: "Ficussssss", image: UIImage(systemName: "photo")!)]
    
    // MARK: - UI Components
    private let addNewPlantButton: UIButton = {
        let button = UIButton()
        let cameraImage = UIImage(systemName: "plus")
        button.setImage(cameraImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupaddNewFlowerButton()
        setupTableView()
        setupSubViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        view.addSubview(addNewPlantButton)
        view.addSubview(tableView)
    }
    
    private func setupaddNewFlowerButton() {
        let addNewFlowerBarButtonItem = UIBarButtonItem(customView: addNewPlantButton)
        navigationItem.rightBarButtonItem = addNewFlowerBarButtonItem
        
        addNewPlantButton.addAction(UIAction(handler: { [weak self] action in
            guard let self else { return }
            let addNewMyPlantViewController = AddNewMyPlantViewController()
            navigationController?.pushViewController(addNewMyPlantViewController, animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(MyPlantTableViewCell.self, forCellReuseIdentifier: MyPlantTableViewCell.cellID)
    }

    
    // MARK: - Setup Constraints
    private func setupConstraints() {
       setUpTableViewConstraints()
    }
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Class Methods
}

// MARK: - Table View Datasource
extension MyGardenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let myPlant = myPlants[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: MyPlantTableViewCell.cellID, for: indexPath)
        if let cell = cell as? MyPlantTableViewCell {
            cell.configure(with: myPlant)
        }
        return cell
    }
}

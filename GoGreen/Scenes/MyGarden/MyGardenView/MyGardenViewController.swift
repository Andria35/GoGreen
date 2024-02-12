//
//  MyGardenViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit

final class MyGardenViewController: UIViewController {
    
    // MARK: - Class Properties
    private var myPlants: [MyPlant] = [] {
        didSet {
            updateAddYourPlantLabelVisibility()
        }
    }
    
    private let viewModel: MyGardenViewModel
    
    // MARK: - UI Components
    lazy private var addNewPlantButton = CustomUIButton(title: nil, image: UIImage(systemName: "plus"), customBackgroundColor: nil, fontSize: nil, isRounded: false, height: nil, width: nil, customAction: addNewFlowerButtonTapped)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.mainBackgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let addYourPlantLabel = CustomUILabel(customText: "Add Your Plant", fontSize: .big, customNumberOfLines: 0)
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Initialization
    init(viewModel: MyGardenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupAddNewFlowerButton()
        setupTableView()
        setupSubViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.mainBackgroundColor
    }
    
    private func setupSubViews() {
        view.addSubview(addNewPlantButton)
        view.addSubview(tableView)
        
        view.addSubview(addYourPlantLabel)
    }
    
    private func setupAddNewFlowerButton() {
        let addNewFlowerBarButtonItem = UIBarButtonItem(customView: addNewPlantButton)
        navigationItem.rightBarButtonItem = addNewFlowerBarButtonItem
    }
    
    private func addNewFlowerButtonTapped() {
        let addNewMyPlantViewController = AddNewMyPlantViewController(notificationManager: NotificationManager(), imagePickerManager: ImagePickerManager())
        addNewMyPlantViewController.delegate = self
        navigationController?.pushViewController(addNewMyPlantViewController, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(MyPlantTableViewCell.self, forCellReuseIdentifier: MyPlantTableViewCell.cellID)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setUpTableViewConstraints()
        setupEmptyLabelConstraints()
    }
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupEmptyLabelConstraints() {
        addYourPlantLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addYourPlantLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: - Setup Delegates
    private func setupDelegates() {
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Class Methods
    private func updateAddYourPlantLabelVisibility() {
        addYourPlantLabel.isHidden = !myPlants.isEmpty
    }
}

// MARK: - MyGardenViewModel Delegate
extension MyGardenViewController: MyGardenViewModelDelegate {
    func fetchComplete(myPlants: [MyPlant]) {
        self.myPlants = myPlants
        tableView.reloadData()
    }
}

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
            cell.configure(name: myPlant.name ?? "", image: viewModel.getImageFromImagePath(imagePath: myPlant.plantID ?? ""))
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}

// MARK: - Tableview Delegate
extension MyGardenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myPlantDetailsViewController = MyPlantDetailsViewController(animationManager: AnimationManager())
        myPlantDetailsViewController.delegate = self
        let myPlant = myPlants[indexPath.row]
        myPlantDetailsViewController.configureMyPlant(name: myPlant.name, description: myPlant.plantDescription, id: myPlant.plantID, image: viewModel.getImageFromImagePath(imagePath: myPlant.plantID ?? ""))
        navigationController?.pushViewController(myPlantDetailsViewController, animated: true)
    }
}

// MARK: - AddNewMyPlantViewController Delegate
extension MyGardenViewController: AddNewMyPlantViewControllerDelegate {
    func saveTapped(myPlantName: String?, myPlantImage: UIImage?, myPlantDescription: String?, notificationRepeatDays: Double) {
        viewModel.saveMyPlantLocally(name: myPlantName, image: myPlantImage, description: myPlantDescription, notificationRepeatDays: notificationRepeatDays)
        tableView.reloadData()
    }
}

// MARK: - MyPlantDetailsViewController Delegate
extension MyGardenViewController: MyPlantDetailsViewControllerDelegate {
    func deletePressed(myPlantID: String) {
        viewModel.deleteMyPlantLocally(with: myPlantID)
    }
}

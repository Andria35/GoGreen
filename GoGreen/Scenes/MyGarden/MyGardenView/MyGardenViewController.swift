//
//  MyGardenViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit

final class MyGardenViewController: UIViewController {

    // MARK: - Class Properties
    var myPlants: [MyPlant] = []
    let viewModel: MyGardenViewModel
    
    // MARK: - UI Components
    lazy private var addNewPlantButton: UIButton = CustomUIButton(title: nil, image: UIImage(systemName: "plus"), customBackgroundColor: nil, fontSize: nil, isRounded: false, height: nil, width: nil, customAction: addNewFlowerButtonTapped)
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycles
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
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        view.addSubview(addNewPlantButton)
        view.addSubview(tableView)
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
        tableView.dataSource = self
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
    
    // MARK: - Setup Delegates
    private func setupDelegates() {
        viewModel.delegate = self
    }
}



//
//  PlantCareViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit

final class PlantCareViewController: UIViewController {
    
    // MARK: - Class Properties
    private var plantCareVideos: [PlantCareVideo] = []
    private let viewModel: PlantCareViewModel
    
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
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
    init(viewModel: PlantCareViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupCollectionView()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.mainBackgroundColor
    }
    
    private func setupSubViews() {
        view.addSubview(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView.register(PlantCareVideoCollectionViewCell.self, forCellWithReuseIdentifier: PlantCareVideoCollectionViewCell.identifier)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }
    
    // MARK: - Class Methods
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.delegate = self
    }
}

// MARK: - PlantCareViewModelDelegate
extension PlantCareViewController: PlantCareViewModelDelegate {
    func fetchCompleted(plantCareVideos: [PlantCareVideo]) {
        self.plantCareVideos = plantCareVideos
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension PlantCareViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        plantCareVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCareVideoCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? PlantCareVideoCollectionViewCell {
            cell.configure(plantCareVideo: plantCareVideos[indexPath.row])
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PlantCareViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width / 2) - 5
        return CGSize(width: size, height: size)
    }
}

// MARK: - UICollectionViewDelegate
extension PlantCareViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoViewController = VideoViewController(videoID: plantCareVideos[indexPath.row].id.videoID)
        present(videoViewController, animated: true)
    }
}

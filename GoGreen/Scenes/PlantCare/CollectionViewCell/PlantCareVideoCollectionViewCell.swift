//
//  PlantCareVideoCollectionViewCell.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit
import NetworkManager

final class PlantCareVideoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Class Properties
    static let identifier = "PlantCareVideoCollectionViewCell"
    private let viewModel: PlantCareVideoCollectionViewCellViewModel
    
    // MARK: - UI Components
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let imageView = CustomUIImageView(customImage: nil, customTintColor: nil, height: nil, width: nil)
    
    private let label = CustomUILabel(customText: "Test", fontSize: .small, customNumberOfLines: 1)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        viewModel = PlantCareVideoCollectionViewCellViewModel(networkManager: NetworkManager())
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupBackground() {
        backgroundColor = .none
    }
    
    private func setupSubViews() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(label)
        
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupVerticalStackViewConstraints()
    }
    
    private func setupVerticalStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    // MARK: - Class Methods
    func configure(plantCareVideo: PlantCareVideo) {
        label.text = plantCareVideo.snippet?.title
        viewModel.cellDidLoad(thumbnailURL: plantCareVideo.snippet?.thumbnails?.medium?.url ?? "")
    }
    
    private func setupDelegates() {
        viewModel.delegate = self
    }
}

extension PlantCareVideoCollectionViewCell: PlantCareVideoCollectionViewCellViewModelDelegate {
    func fetchComplete(image: UIImage) {
        imageView.image = image
    }
    

}


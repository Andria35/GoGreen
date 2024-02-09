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
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let imageView = CustomUIImageView(customImage: nil, customTintColor: nil, height: nil, width: nil)
    
    private let label = CustomUILabel(customText: "Test", fontSize: .extraSmall, customNumberOfLines: 1)
    
    private let playImageView = CustomUIImageView(customImage: UIImage(systemName: "play.circle"), customTintColor: UIColor.secondaryBackgroundColor, opacity: 1, height: 50, width: 50)
    
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
        setupCell()
        setupSubViews()
    }
    
    private func setupCell() {
        backgroundColor = UIColor.secondaryBackgroundColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    private func setupSubViews() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(label)
        
        imageView.addSubview(playImageView)
        
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupVerticalStackViewConstraints()
        setupPlayImageViewConstraints()
    }
    
    private func setupVerticalStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    private func setupPlayImageViewConstraints() {
        playImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        playImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    // MARK: - Class Methods
    func configure(plantCareVideo: PlantCareVideo) {
        label.text = plantCareVideo.snippet?.title
        if let urlString = plantCareVideo.snippet?.thumbnails?.medium?.url {
            viewModel.cellDidLoad(thumbnailURL: urlString)
        }
    }
    
    private func setupDelegates() {
        viewModel.delegate = self
    }
}

// MARK: - PlantCareVideoCollectionViewCellViewModelDelegate
extension PlantCareVideoCollectionViewCell: PlantCareVideoCollectionViewCellViewModelDelegate {
    func fetchComplete(image: UIImage) {
        imageView.image = image
    }
    
    
}


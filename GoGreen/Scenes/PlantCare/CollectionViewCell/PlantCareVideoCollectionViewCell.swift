//
//  PlantCareVideoCollectionViewCell.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit

final class PlantCareVideoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Class Properties
    static let identifier = "PlantCareVideoCollectionViewCell"
    
    // MARK: - UI Components
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    private let imageView = CustomUIImageView(customImage: UIImage(systemName: "photo"), customTintColor: nil, height: nil, width: nil)
    
    private let label = CustomUILabel(customText: "Test", fontSize: .small, customNumberOfLines: 0)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        
//        self.viewModel = MovieCollectionViewCellViewModel()
        super.init(frame: frame)
//        self.viewModel.updateData = self.updatePoster
        imageView.backgroundColor = .blue

        setupUI()
        setupConstraints()
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
    func configure() {
        
    }
    
}

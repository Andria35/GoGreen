//
//  MyPlantTableViewCell.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import UIKit

class MyPlantTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let cellID = "MyPlantCell"
    
    // MARK: - UI Components
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private let plantImageView = CustomUIImageView(customImage: nil, customTintColor: nil, height: 150, width: 150)
    
    private let plantNameLabel: UILabel = CustomUILabel(customText: nil, fontSize: .medium, customNumberOfLines: 0)
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupView()
        setUpSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        plantNameLabel.text = nil
        plantImageView.image = nil
    }
    
    // MARK: - Configure
    func configure(name: String, image: UIImage?) {
        plantNameLabel.text = name
        plantImageView.image = image
    }
    
    private func setupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    private func setUpSubViews() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(plantImageView)
        horizontalStackView.addArrangedSubview(plantNameLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
}

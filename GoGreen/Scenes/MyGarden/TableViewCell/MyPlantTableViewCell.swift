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
    
    private let plantImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private let plantLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont.
//        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()
    
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
        
        plantLabel.text = nil
        plantImageView.image = nil
    }
    
    // MARK: - Configure
    func configure(with model: MyPlant) {
        plantLabel.text = model.name
        plantImageView.image = model.image
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
        horizontalStackView.addArrangedSubview(plantLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
        plantImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        plantImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

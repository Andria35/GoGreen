//
//  MyPlantTableViewCell.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import UIKit

final class MyPlantTableViewCell: UITableViewCell {

    // MARK: - Class Properties
    static let cellID = "MyPlantCell"
    
    // MARK: - UI Components
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.backgroundColor = UIColor.secondaryBackgroundColor
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    private var plantImageView = CustomUIImageView(customImage: nil, customTintColor: nil, height: nil, width: 130)
    
    private let plantNameLabel = CustomUILabel(customText: nil, fontSize: .medium, customNumberOfLines: 0)
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupCellUI()
        setUpSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Prepare For Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        plantNameLabel.text = nil
        plantImageView.image = nil
    }
    
    private func setupCellUI() {
        self.backgroundColor = UIColor.mainBackgroundColor
    }
    
    // MARK: - Configure
    func configure(name: String, image: UIImage?) {
        plantNameLabel.text = name
        plantImageView.image = image
    }
        
    private func setUpSubViews() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(plantImageView)
        horizontalStackView.addArrangedSubview(plantNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        horizontalStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

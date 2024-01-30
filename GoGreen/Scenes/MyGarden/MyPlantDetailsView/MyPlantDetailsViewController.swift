//
//  MyPlantDetailsViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 29.01.24.
//

import UIKit

final class MyPlantDetailsViewController: UIViewController {
    
    // MARK: - Class Properties
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    let myPlantImageView = CustomUIImageView(customImage: UIImage(systemName: "photo"), customTintColor: nil, height: 300, width: nil)
    
    private let nameHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let nameLabel = CustomUILabel(customText: "Name: ", fontSize: .medium, customNumberOfLines: 1)
    
    private let myPlantNameLabel = CustomUILabel(customText: "ficus", fontSize: .medium, customNumberOfLines: 1)
    
    private let descriptionVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()
    
    private let descriptionLabel = CustomUILabel(customText: "Description:", fontSize: .medium, customNumberOfLines: 1)
    
    private let myPlantDescriptionLabel = CustomUILabel(customText: "blabla", fontSize: .medium, customNumberOfLines: 0)
    

    

    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(myPlantImageView)
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
        verticalStackView.addArrangedSubview(nameHorizontalStackView)
        nameHorizontalStackView.addArrangedSubview(nameLabel)
        nameHorizontalStackView.addArrangedSubview(myPlantNameLabel)
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
        
        verticalStackView.addArrangedSubview(descriptionVerticalStackView)
        descriptionVerticalStackView.addArrangedSubview(descriptionLabel)
        descriptionVerticalStackView.addArrangedSubview(myPlantDescriptionLabel)
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
    }
    
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupVerticalStackViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupVerticalStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }
    // MARK: - Class Methods
    func configureMyPlant(name: String?, description: String?, id: String?, image: UIImage?) {
//        myPlant?.name = name
//        myPlant?.plantDescription = description
//        myPlant?.plantID = id
        myPlantNameLabel.text = name
        myPlantDescriptionLabel.text = description
        myPlantImageView.image = image
    }
}

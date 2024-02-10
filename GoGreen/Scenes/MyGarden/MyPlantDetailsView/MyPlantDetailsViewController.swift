//
//  MyPlantDetailsViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 29.01.24.
//

import UIKit

final class MyPlantDetailsViewController: UIViewController {
    
    // MARK: - Class Properties
    var myPlantID: String?
    weak var delegate: MyPlantDetailsViewControllerDelegate?
    let animationManager: Animating
    
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
    
    let myPlantImageView = CustomUIImageView(customImage: UIImage(systemName: "photo"), customTintColor: nil, opacity: 0.1, height: 300, width: nil)
    
    private let nameHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let nameLabel = CustomUILabel(customText: "Name: ", fontSize: .medium, customNumberOfLines: 1, alpha: 0.5)
    
    private let myPlantNameLabel = CustomUILabel(customText: "ficus", fontSize: .medium, customNumberOfLines: 1)
    
    private let descriptionVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let descriptionLabel = CustomUILabel(customText: "Description:", fontSize: .medium, customNumberOfLines: 1, alpha: 0.5)
    
    private let myPlantDescriptionLabel = CustomUILabel(customText: "", fontSize: .medium, customNumberOfLines: 0)
    
    private let buttonsHorizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var copyButton = CustomUIButton(title: "Copy", image: nil, customBackgroundColor: .systemBlue, fontSize: .big, isRounded: true, height: 50, width: nil, customAction: copyButtonTapped)
    
    lazy private var shareButton = CustomUIButton(title: "Share", image: nil, customBackgroundColor: .systemBlue, fontSize: .big, isRounded: true, height: 50, width: nil, customAction: shareButtonTapped)
    
    lazy private var deleteButton = CustomUIButton(title: "Delete", image: nil, customBackgroundColor: .systemRed, fontSize: .big, isRounded: true, height: 50, width: nil, customAction: deleteButtonTapped)
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Initialization
    init(animationManager: Animating) {
        self.animationManager = animationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.mainBackgroundColor
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
        verticalStackView.addArrangedSubview(buttonsHorizontalStack)
        
        buttonsHorizontalStack.addArrangedSubview(deleteButton)
        buttonsHorizontalStack.addArrangedSubview(copyButton)
        buttonsHorizontalStack.addArrangedSubview(shareButton)
    }
    
    private func deleteButtonTapped() {
        delegate?.deletePressed(myPlantID: myPlantID ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    private func copyButtonTapped() {
        guard let plantName = myPlantNameLabel.text else { return }
        UIPasteboard.general.string = plantName
        
        animationManager.successAnimation(viewController: self)
    }
    
    private func shareButtonTapped() {
        guard let image = myPlantImageView.image else { return }
        
        let shareSheetViewController = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil)
        
        present(shareSheetViewController, animated: true)
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
        myPlantID = id
        myPlantNameLabel.text = name
        myPlantDescriptionLabel.text = description
        myPlantImageView.image = image
    }
}

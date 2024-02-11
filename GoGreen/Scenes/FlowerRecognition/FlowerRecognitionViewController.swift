//
//  FlowerRecognitionViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit
import SwiftUI
import NetworkManager

final class FlowerRecognitionViewController: UIViewController {

    // MARK: - Class Properties
    private let viewModel: FlowerRecognitionViewModel
    private let alertManager: Alerting
    private let imagePickerManager: ImagePicking
    
    // MARK: - UI Components
    lazy private var cameraButton = CustomUIButton(title: nil, image: UIImage(systemName: "camera.fill"), customBackgroundColor: nil, fontSize: nil, isRounded: false, height: nil, width: nil, customAction: cameraButtonTapped)
        
    lazy var flowerDetailsHostingController: UIHostingController<PlantDetailsView> = {
        let hostingController = UIHostingController(
            rootView: PlantDetailsView(
                viewModel: PlantDetailsViewModel(
                    id: nil, networkManager: NetworkManager())))
        return hostingController
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()
    }
    
    // MARK: - Initialization
    init(viewModel: FlowerRecognitionViewModel, alertManager: Alerting, imagePickerManager: ImagePicking) {
        self.viewModel = viewModel
        self.alertManager = alertManager
        self.imagePickerManager = imagePickerManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubviews()
        setupCameraButton()
    }
    
    private func setupSubviews() {
        view.addSubview(cameraButton)
        
        addChild(flowerDetailsHostingController)
        view.addSubview(flowerDetailsHostingController.view)
        flowerDetailsHostingController.didMove(toParent: self)
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupCameraButton() {
        let cameraBarButtonItem = UIBarButtonItem(customView: cameraButton)
        navigationItem.rightBarButtonItem = cameraBarButtonItem
    }
    
    private func cameraButtonTapped() {
        imagePickerManager.showCamera(viewController: self)
    }
        
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupFlowerDetailsHostingControllerConstraints()
    }
    
    private func setupFlowerDetailsHostingControllerConstraints() {
        flowerDetailsHostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        flowerDetailsHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        flowerDetailsHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        flowerDetailsHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        flowerDetailsHostingController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Setup Delegates
    private func setupDelegates() {
        viewModel.delegate = self
    }
}

// MARK: - ImagePicker Delegate
extension FlowerRecognitionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            viewModel.detectPlant(image: userPickedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - FlowerRecognitionViewModel Delegate
extension FlowerRecognitionViewController: FlowerRecognitionViewModelDelegate {
    func displayFlowerRecognitionFailedAlert() {
        alertManager.displayAlert(message: "There was a problem recognising this image", buttonTitle: "Ok", vc: self)
    }
    
    func fetchCompleted(plant: Plant) {
        flowerDetailsHostingController.rootView = PlantDetailsView(viewModel: PlantDetailsViewModel(id: plant.id, networkManager: NetworkManager()))
    }
}

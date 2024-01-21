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
    private let viewModel = FlowerRecognitionViewModel(networkManager: NetworkManager())
    lazy var hostingController: UIHostingController<PlantDetailsView> = {
        let hostingController = UIHostingController(rootView: PlantDetailsView(viewModel: PlantDetailsViewModel(id: nil, networkManager: NetworkManager())))
        return hostingController
    }()
    
    // MARK: - UI Components
    private let cameraButton: UIButton = {
        let button = UIButton()
        let cameraImage = UIImage(systemName: "camera.fill")
        button.setImage(cameraImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imagePicker = UIImagePickerController()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupDelegates()
    }
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubviews()
        setupCameraButton()
        setupImagePicker()
    }
    
    private func setupSubviews() {
        view.addSubview(cameraButton)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    
    private func setupCameraButton() {
        let cameraBarButtonItem = UIBarButtonItem(customView: cameraButton)
        navigationItem.rightBarButtonItem = cameraBarButtonItem
        
        cameraButton.addAction(UIAction(handler: { [weak self] action in
            guard let self else { return }
            present(self.imagePicker, animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
    }
    // MARK: - Setup Constraints
    private func setupConstraints() {
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

    }
    
    
    private func setupDelegates() {
        viewModel.delegate = self
    }
    // MARK: - Class Methods
}


// MARK: - ImagePickerDelegate
extension FlowerRecognitionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            viewModel.detectPlant(image: userPickedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - FlowerRecognitionViewModelDelegate
extension FlowerRecognitionViewController: FlowerRecognitionViewModelDelegate {
    func fetchCompleted(plant: Plant) {
        hostingController.rootView = PlantDetailsView(viewModel: PlantDetailsViewModel(id: plant.id, networkManager: NetworkManager()))
         
    }
}

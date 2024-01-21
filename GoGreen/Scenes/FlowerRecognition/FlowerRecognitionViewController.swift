//
//  FlowerRecognitionViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import UIKit
import CoreML
import Vision

final class FlowerRecognitionViewController: UIViewController {

    // MARK: - Class Properties
    private let viewModel = FlowerRecognitionViewModel()
    
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

    }
    // MARK: - Class Methods
}


// MARK: - ImagePickerDelegate
extension FlowerRecognitionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert to ciImage")
            }
            viewModel.detect(image: convertedCIImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

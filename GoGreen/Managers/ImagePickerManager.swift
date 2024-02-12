//
//  ImagePickerManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

protocol ImagePicking {
    func showCamera(viewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate)
    func showPhotoLibrary(viewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate)
}

final class ImagePickerManager: ImagePicking {
    
    // MARK: - Class Methods
    func showCamera(viewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = viewController
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func showPhotoLibrary(viewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = viewController
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        viewController.present(imagePicker, animated: true, completion: nil)
    }
}

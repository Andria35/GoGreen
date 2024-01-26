//
//  FlowerRecognitionViewController+ImagePicker.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - ImagePickerDelegate
extension FlowerRecognitionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            viewModel.detectPlant(image: userPickedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

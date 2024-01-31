//
//  AddNewMyPlantViewController+ImagePicker.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - ImagePicker Delegate
extension AddNewMyPlantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            myPlantImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

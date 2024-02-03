//
//  AddNewMyPlantViewController+TextField.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 29.01.24.
//

import UIKit

// MARK: UITextFieldDelegate
extension AddNewMyPlantViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == myPlantNameTextField {
            
            if let text = myPlantNameTextField.text, !text.isEmpty {
                saveButton.backgroundColor = .systemBlue
                saveButton.isEnabled = true
            } else {
                saveButton.backgroundColor = .systemGray
                saveButton.isEnabled = false
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

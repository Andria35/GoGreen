//
//  AddNewMyPlantViewController+PickerView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - PickerView Delegate and DataSource
extension AddNewMyPlantViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(pickerViewValues[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        notificationDays = pickerViewValues[row]
        let day = notificationDays == 1 ? "Day" : "Days"
        notificationTextField.text = "Repeat Every \(notificationDays) " + day
        notificationTextField.resignFirstResponder()
    }
}

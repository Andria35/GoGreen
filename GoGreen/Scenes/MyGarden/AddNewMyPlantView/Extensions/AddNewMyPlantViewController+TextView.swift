//
//  AddNewMyPlantViewController+TextView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

// MARK: - TextView Delegate
extension AddNewMyPlantViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myPlantDescriptionTextView.hidePlaceholderLabel()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            myPlantDescriptionTextView.unhidePlaceholderLabel()

        }
    }
}

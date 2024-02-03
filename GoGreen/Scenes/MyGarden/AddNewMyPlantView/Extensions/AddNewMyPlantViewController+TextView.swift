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
//        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
//        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            myPlantDescriptionTextView.unhidePlaceholderLabel()

        }
    }
}

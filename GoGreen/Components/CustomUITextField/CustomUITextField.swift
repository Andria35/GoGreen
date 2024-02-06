//
//  CustomUITextField.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUITextField: UITextField {

    // MARK: - Initialization
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.masksToBounds = true
        layer.borderColor = UIColor.systemGray.cgColor
        backgroundColor = UIColor.secondaryBackgroundColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
        
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

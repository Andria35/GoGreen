//
//  CustomUITextView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUITextView: UITextView {
    
    // MARK: - Class Properties
    let placeholder: String
    
    // MARK: - UI Components
    lazy private var placeholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(placeholder)"
        label.textColor = .systemGray.withAlphaComponent(0.5)
        return label
    }()

    // MARK: - Initialization
    init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: CGRect.zero, textContainer: nil)
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.borderColor = UIColor.systemGray.cgColor
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        addSubview(placeholderLabel)
    }
    
    // MARK: - SetupConstraints
    private func setupConstraints() {
        heightAnchor.constraint(equalToConstant: 200).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Methods
    func hidePlaceholderLabel() {
        placeholderLabel.isHidden = true
    }
    
    func unhidePlaceholderLabel() {
        placeholderLabel.isHidden = false

    }
}

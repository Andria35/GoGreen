//
//  CustomUIButton.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUIButton: UIButton {
    
    // MARK: Class Properties
    var customAction: () -> Void
    
    // MARK: - Initialization
    init(title: String?,image: UIImage?, customBackgroundColor: UIColor?, fontSize: FontSize?, isRounded: Bool, isEnabled: Bool = true, height: CGFloat?, width: CGFloat?, customAction: @escaping () -> Void) {
        
        self.customAction = customAction
        
        super.init(frame: .zero)
        
        setupUI(title: title, image: image, customBackgroundColor: customBackgroundColor, fontSize: fontSize, isRounded: isRounded, isEnabled: isEnabled)
        setupConstraints(height: height, width: width)
        setupAction()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI(title: String?,image: UIImage?, customBackgroundColor: UIColor?, fontSize: FontSize?, isRounded: Bool, isEnabled: Bool) {
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = isRounded ? 15 : 0
        layer.masksToBounds = true
        self.isEnabled = isEnabled
        
        backgroundColor = customBackgroundColor
        
        if let fontSize {
            
            switch fontSize {
            case .big:
                titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            case .medium:
                titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            case .small:
                titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            }
        }
    }
    
    // MARK: - Setup Action
    private func setupAction() {
        addAction(UIAction(handler: { [weak self] action in
            self?.customAction()
        }), for: .touchUpInside)
    }

    
    // MARK: - Setup Constraints
    private func setupConstraints(height: CGFloat?, width: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
            
        }
        
    }
}

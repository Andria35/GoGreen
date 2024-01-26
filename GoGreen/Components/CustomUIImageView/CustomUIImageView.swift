//
//  CustomUIImageView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUIImageView: UIImageView {
    
    // MARK: - Class Propertie
    let height: CGFloat?
    let width: CGFloat?
    
    // MARK: - Initialization
    init(customImage: UIImage?, customTintColor: UIColor?, height: CGFloat?, width: CGFloat?) {
        self.height = height
        self.width = width
        super.init(frame: CGRect.zero)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        tintColor = customTintColor
        image = customImage
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
            
        }
    }
    
}

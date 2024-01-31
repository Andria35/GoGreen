//
//  CustomUIDividerLine.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUIDividerLine: UIView {
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

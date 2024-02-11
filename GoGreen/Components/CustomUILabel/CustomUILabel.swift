//
//  CustomUILabel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

final class CustomUILabel: UILabel {

    // MARK: - Initialization
    init(customText: String?, fontSize: FontSize?, customNumberOfLines: Int?, alpha: CGFloat = 1.0) {
        super.init(frame: .zero)
        text = customText
        self.alpha = alpha
        
        if let customNumberOfLines {
            numberOfLines = customNumberOfLines
        }
        
        if let fontSize {
            switch fontSize {
            case .big:
                font = .systemFont(ofSize: 22, weight: .bold)
            case .medium:
                font = .systemFont(ofSize: 18, weight: .semibold)
            case .small:
                font = .systemFont(ofSize: 16, weight: .semibold)
            case .extraSmall:
                font = .systemFont(ofSize: 12, weight: .medium)

            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

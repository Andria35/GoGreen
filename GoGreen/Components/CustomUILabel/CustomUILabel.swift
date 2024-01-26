//
//  CustomUILabel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 26.01.24.
//

import UIKit

class CustomUILabel: UILabel {

    init(customText: String?, fontSize: FontSize?, customNumberOfLines: Int?) {
        super.init(frame: .zero)
        text = customText
        
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
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  PlantCareViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import UIKit

class PlantCareViewController: UIViewController {

    // MARK: - Class Properties
    // MARK: - UI Components
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.mainBackgroundColor
    }
    
    private func setupSubViews() {
        
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
    }
    // MARK: - Class Methods
}

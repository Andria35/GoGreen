//
//  AddNewMyPlantViewControllerDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 27.01.24.
//

import UIKit

protocol AddNewMyPlantViewControllerDelegate: AnyObject {
    func saveTapped(myPlantName: String?, myPlantImage: UIImage?, myPlantDescription: String?)
}

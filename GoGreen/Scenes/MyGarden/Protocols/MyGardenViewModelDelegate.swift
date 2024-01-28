//
//  MyGardenViewModelDelegate.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 27.01.24.
//

import Foundation

protocol MyGardenViewModelDelegate: AnyObject {
    func fetchComplete(myPlants: [MyPlant])
}

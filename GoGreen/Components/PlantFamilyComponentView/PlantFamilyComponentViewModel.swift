//
//  PlantFamilyComponentViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import Foundation

final class PlantFamilyComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    private var plants: [Plant]
    let sectionTitle: SectionTitles?
    
    // MARK: - Computed Property
    var filteredPlants: [Plant] {
        plants.filter { $0.commonName != nil && $0.imageURL != nil}
    }
    
    // MARK: - SectionTitles
    enum SectionTitles: String {
        case roses
        case daisies
        case irises
        case jasmines
        case sunflowers
    }

    // MARK: - Initialization
    init(plants: [Plant], sectionTitle: SectionTitles?) {
        self.plants = plants
        self.sectionTitle = sectionTitle
    }
}

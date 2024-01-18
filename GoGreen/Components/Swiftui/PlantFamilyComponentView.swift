//
//  PlantFamilyComponentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import SwiftUI
import NetworkManager

struct PlantFamilyComponentView: View {
    
    // MARK: - Properties
    let plants: [Plant]
    private let gridLayout: [GridItem] = [
        GridItem(.fixed(300))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridLayout) {
                ForEach(plants) { plant in
                    PlantComponentView(viewModel: PlantComponentViewModel(plant: plant, networkManager: NetworkManager()))
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlantFamilyComponentView(plants: [PlantMockData.plant])
}

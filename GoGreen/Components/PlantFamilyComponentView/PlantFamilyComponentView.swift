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
    private let gridLayout: [GridItem] = [
        GridItem(.fixed(300))
    ]
    @ObservedObject var viewModel: PlantFamilyComponentViewModel
    
    // MARK: - SectionTitles
    enum SectionTitles: String {
        case roses
        case daisies
        case irises
        case jasmines
        case sunflowers
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            sectionTitleText
            ScrollView(.horizontal) {
                plantFamilyHGrid
            }
        }
    }
}

// MARK: - Components
extension PlantFamilyComponentView {
    
    // MARK: - SectionTitleText
    private var sectionTitleText: some View {
        Text(viewModel.sectionTitle?.rawValue.capitalized ?? "")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title)
            .fontWeight(.semibold)
    }
    
    // MARK: - PlantFamilyHGrid
    private var plantFamilyHGrid: some View {
        LazyHGrid(rows: gridLayout) {
            ForEach(viewModel.filteredPlants) { plant in
                PlantComponentView(viewModel: PlantComponentViewModel(plant: plant, networkManager: NetworkManager()))
            }
        }

    }
}

#Preview {
    ZStack {
        MainBackgroundComponentView()
        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: [PlantMockData.plant], sectionTitle: .daisies))
    }
}

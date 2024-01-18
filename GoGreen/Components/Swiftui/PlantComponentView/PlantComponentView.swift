//
//  PlantComponentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import SwiftUI
import NetworkManager

struct PlantComponentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: PlantComponentViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            viewModel.plantImage
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 170, height: 200)
                .padding(35)
                .background(Color.homeViewSecondaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(viewModel.formatPlantName())
                .padding(.top)
                .padding(.bottom, 8)
                .font(.callout)
                .fontWeight(.medium)
        }
    }
}

// MARK: - Preview
#Preview {
    PlantComponentView(viewModel: PlantComponentViewModel(plant: PlantMockData.plant, networkManager: NetworkManager()))
}

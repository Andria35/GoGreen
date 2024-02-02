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
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            if let image = viewModel.plantImage{
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 170, height: 200)
                    .padding(35)
                    .background(Color.homeViewSecondaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                placeholderImage
            }
            
            Text(viewModel.formatPlantName())
                .padding(.top)
                .padding(.bottom, 8)
                .font(.title3)
                .fontWeight(.medium)
        }
        .onTapGesture {
            router.navigate(to: .plantDetailsView(id: viewModel.plant.id))
        }
    }
}

// MARK: - UI Components
extension PlantComponentView {
    // MARK: - PlaceholderImage
    private var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .opacity(0.0)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 170, height: 200)
            .padding(35)
            .background(Color.homeViewSecondaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Preview
#Preview {
    PlantComponentView(viewModel: PlantComponentViewModel(plant: PlantMockData.plant, networkManager: NetworkManager()))
}

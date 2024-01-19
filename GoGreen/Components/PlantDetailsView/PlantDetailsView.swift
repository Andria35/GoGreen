//
//  PlantDetailsView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import SwiftUI
import NetworkManager

struct PlantDetailsView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: PlantDetailsViewModel
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                viewModel.plantImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(contentMode: .fit)
                
                Divider()
                
                
                PlantDetailsTextComponentView(description: "Name", feature: viewModel.plantDetails?.commonName ?? "")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Scientific Name", feature: viewModel.plantDetails?.scientificName ?? "")
                Divider()
                
                PlantDetailsTextComponentView(description: "Discovered In", feature: "\(viewModel.plantDetails?.year ?? 0)")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Bibliography", feature: viewModel.plantDetails?.bibliography ?? "")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Author Of Photo", feature: viewModel.plantDetails?.author ?? "")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Observations", feature: viewModel.plantDetails?.observations ?? "")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Genus", feature: viewModel.plantDetails?.mainSpecies.genus ?? "")
                
                Divider()
                
                PlantDetailsTextComponentView(description: "Family", feature: viewModel.plantDetails?.mainSpecies.family ?? "")
                Divider()
                
                PlantDetailsTextComponentView(description: "Edible", feature: viewModel.plantDetails?.mainSpecies.edible ?? false ? "Yes" : "no")
            }
            .padding()
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Details")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        PlantDetailsView(viewModel: PlantDetailsViewModel(id: 143205, networkManager: NetworkManager()))
    }
}

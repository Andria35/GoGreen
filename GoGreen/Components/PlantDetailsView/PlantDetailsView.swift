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
        ZStack {
            MainBackgroundComponentView()
            if viewModel.plantDetails != nil {
                ScrollView {
                    VStack(alignment: .leading) {
                        if let image = viewModel.plantImage {
                            image
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .aspectRatio(contentMode: .fit)
                        } else {
                            placeHolderImage
                        }
                        Divider()
                        plantDetailsTextComponentsVStack
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
                
            } else {
                noFlowerInfoVStack
            }

        }
    }
}

// MARK: - Components
extension PlantDetailsView {
    
    // MARK: - PlantImage
    private var placeHolderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .opacity(0)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .aspectRatio(contentMode: .fit)
            .overlay {
                ProgressView()
            }
        
    }
    
    // MARK: - PlantDetailsTextComponentsVStack
    private var plantDetailsTextComponentsVStack: some View {
        VStack(alignment: .leading) {
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
            
            PlantDetailsTextComponentView(description: "Genus", feature: viewModel.plantDetails?.mainSpecies?.genus ?? "")
            
            Divider()
            
            PlantDetailsTextComponentView(description: "Family", feature: viewModel.plantDetails?.mainSpecies?.family ?? "")
            Divider()
            
            PlantDetailsTextComponentView(description: "Edible", feature: viewModel.plantDetails?.mainSpecies?.edible ?? false ? "Yes" : "no")
        }
    }
    
    // MARK: - NoFlowerInfoVStack
    private var noFlowerInfoVStack: some View {
        VStack {
            Image(systemName: "leaf")
            Text("No Flower Info")
        }
        .font(.largeTitle)
        .fontWeight(.bold)
    }
    
}

// MARK: - Preview
#Preview {
    NavigationStack {
        PlantDetailsView(viewModel: PlantDetailsViewModel(id: 501, networkManager: NetworkManager()))
    }
}

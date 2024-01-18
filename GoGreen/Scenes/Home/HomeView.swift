//
//  HomeView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI
import NetworkManager

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: HomeViewModel
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                findNewPlantsText
                searchBarHStack

                if viewModel.plantsFamilyIsEmpty() {
                    ProgressView()
                } else {
                    if viewModel.textfieldText.isEmpty {
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.roses, sectionTitle: .roses))
                        
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.daisies, sectionTitle: .daisies))
                        
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.irises, sectionTitle: .irises))
                        
                        
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.jasmines, sectionTitle: .jasmines))
                        
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.sunflowers, sectionTitle: .sunflowers))
                    } else {
                        PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.searchResult, sectionTitle: nil))
                    }
                }
                
                
            }
            .padding()
        }
    }
}

// MARK: - Components
extension HomeView {
    
    // MARK: - FindNewPlantsText
    private var findNewPlantsText: some View {
        Text("Let’s Find\nNew Plants!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    // MARK: - SearchBarHStack
    private var searchBarHStack: some View {
        HStack {
            TextField("Search Plants", text: $viewModel.textfieldText, onCommit: {
                Task {
                    await viewModel.fetchPlantsByTextfieldResult()
                }
            })
            .font(.title2)
            .padding()
            .frame(height: 60)
            .background(Color.homeViewSecondaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                
            }, label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
            })
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
}

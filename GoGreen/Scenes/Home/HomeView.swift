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
    @State var textfieldText: String = ""
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                findNewPlantsText
                searchBarHStack
                
                PlantFamilyComponentView(plants: viewModel.plantFamilies.roses, sectionTitle: .roses)
                
                PlantFamilyComponentView(plants: viewModel.plantFamilies.daisies, sectionTitle: .daisies)
                
                PlantFamilyComponentView(plants: viewModel.plantFamilies.irises, sectionTitle: .irises)
                
                PlantFamilyComponentView(plants: viewModel.plantFamilies.jasmines, sectionTitle: .jasmines)
                
                PlantFamilyComponentView(plants: viewModel.plantFamilies.sunflowers, sectionTitle: .sunflowers)
                
                
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
            TextField("Search Plants", text: $textfieldText)
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

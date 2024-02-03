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
    @State var liveScan: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            ScrollView {
                VStack {
                    findNewPlantsText
                    searchBarHStack

                    if viewModel.plantsFamilyIsEmpty() {
                        ProgressView()
                    } else {
                        if viewModel.textfieldText.isEmpty {
                            plantFamilyComponentViews
                        } else {
                            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.searchResult, sectionTitle: nil))
                        }
                    }
                }
                .padding()
            }
            .fullScreenCover(isPresented: $liveScan, content: {
                LiveTextFromCameraScanView(liveScan: $liveScan, scannedText: $viewModel.textfieldText, fetchPlantsByTextfield: viewModel.fetchPlantsByTextfieldResult)
        })
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
                viewModel.fetchPlantsByTextfieldResult()
            })
            .font(.title2)
            .padding()
            .frame(height: 60)
            .background(Color(UIColor.secondaryBackgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                liveScan.toggle()
            }, label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
            })
        }
    }
    
    // MARK: - PlantFamilyComponentVStack
    private var plantFamilyComponentViews: some View {
        Group {
            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.roses, sectionTitle: .roses))
            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.daisies, sectionTitle: .daisies))
            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.irises, sectionTitle: .irises))
            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.jasmines, sectionTitle: .jasmines))
            PlantFamilyComponentView(viewModel: PlantFamilyComponentViewModel(plants: viewModel.plantFamilies.sunflowers, sectionTitle: .sunflowers))
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
}

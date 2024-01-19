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
            viewModel.plantImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

// MARK: - Preview
#Preview {
    PlantDetailsView(viewModel: PlantDetailsViewModel(id: 143205, networkManager: NetworkManager()))
}

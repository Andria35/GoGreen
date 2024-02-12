//
//  ContentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI
import NetworkManager

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject var router = Router()
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .plantDetailsView(let id):
                        PlantDetailsComponentView(viewModel: PlantDetailsComponentViewModel(id: id, networkManager: NetworkManager()))
                    }
                }
        }
        .environmentObject(router)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

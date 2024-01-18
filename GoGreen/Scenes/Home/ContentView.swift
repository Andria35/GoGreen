//
//  ContentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI
import NetworkManager

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

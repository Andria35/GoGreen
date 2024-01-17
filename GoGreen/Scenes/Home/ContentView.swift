//
//  ContentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI
import NetworkManager

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
        }
    }
}

#Preview {
    ContentView()
}

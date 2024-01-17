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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Let’s Find\nNew Plants!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                TextField("Search Plants", text: $textfieldText)
                    .font(.title2)
                    .padding()
                    .frame(height: 60)
                    .background(Color.homeViewTextfieldBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                })
            }
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
}

//
//  DiscoverPlantView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct DiscoverPlantView: View {
    var body: some View {
        ZStack {
            Color.onboardingBackgroundColor
                .ignoresSafeArea()
            VStack {
                Image("OnboardingDiscoverPlantImage")
                    .resizable()
                    .frame(height: 136)
                    .frame(maxWidth: .infinity)
                VStack(spacing: 0) {
                    Text("Discover Your Type")
                    Text("Of Plant")
                }
                .font(.largeTitle)
                .foregroundStyle(Color.onboardingTitleColor)
                .fontWeight(.semibold)
                .padding()
                
                VStack {
                    Text("Tips N Trick to grow a")
                    Text("healthy plant")
                }
                .font(.title2)
                .foregroundStyle(Color.onboardingTitleColor)
                Spacer()
                
                OnboardingButtonComponentView(title: "Continue") {
                    print("Yayy")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
            .padding(.vertical, 80)
        }
    }
}

#Preview {
    DiscoverPlantView()
}

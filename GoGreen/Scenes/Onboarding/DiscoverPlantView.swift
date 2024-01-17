//
//  DiscoverPlantView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct DiscoverPlantView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void

    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.onboardingBackgroundColor
                .ignoresSafeArea()
            VStack {
                discoverYourPlantImage
                discoverYourTypeVStack
                tipsNTricksVStack
                
                Spacer()
                
                OnboardingButtonComponentView(title: "Continue") {
                    buttonTapped()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
            .padding(.vertical, 80)
        }
    }
}

// MARK: - Components
extension DiscoverPlantView {
    
    // MARK: - DiscoverYourPlantImage
    private var discoverYourPlantImage: some View {
        Image("OnboardingDiscoverPlantImage")
            .resizable()
            .frame(height: 136)
            .frame(maxWidth: .infinity)
    }
    
    // MARK: - DiscoverYourTypeVStack
    private var discoverYourTypeVStack: some View {
        VStack(spacing: 0) {
            Text("Discover Your Type")
            Text("Of Plant")
        }
        .font(.largeTitle)
        .foregroundStyle(Color.onboardingTitleColor)
        .fontWeight(.semibold)
        .padding()
    }
    
    // MARK: - TipsNTricksVStack
    private var tipsNTricksVStack: some View {
        VStack {
            Text("Tips N Trick to grow a")
            Text("healthy plant")
        }
        .font(.title2)
        .foregroundStyle(Color.onboardingTitleColor)
    }
}

// MARK: - Preview
#Preview {
    DiscoverPlantView(buttonTapped: {})
}

//
//  OnboardingView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Body
    var body: some View {
        TabView {
            WelcomeView()
            DiscoverPlantView()
            EmbarkJourneyView()
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}

//
//  OnboardingView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct OnboardingView: View {
    
    enum TabViewTabs {
        case welcomeView
        case discoverPlantView
        case embarkJourneyView
    }
    
    @State var selectedTab: TabViewTabs = .welcomeView
    var dismissTabView: () -> Void
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView() {
                selectedTab = .discoverPlantView
            }
            .tag(TabViewTabs.welcomeView)
            DiscoverPlantView() {
                selectedTab = .embarkJourneyView
            }
            .tag(TabViewTabs.discoverPlantView)
            EmbarkJourneyView() {
                dismissTabView()
            }
            .tag(TabViewTabs.embarkJourneyView)
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
    }
}

// MARK: - Preview
#Preview {
    OnboardingView(dismissTabView: {})
}

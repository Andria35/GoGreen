//
//  OnboardingView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    enum TabViewTabs {
        case welcomeView
        case discoverPlantView
        case embarkJourneyView
    }
    var dismissTabView: () -> Void
    @State var selectedTab: TabViewTabs = .welcomeView
    
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

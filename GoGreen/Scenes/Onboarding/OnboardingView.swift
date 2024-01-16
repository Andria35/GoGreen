//
//  OnboardingView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            WelcomeView()
            Text("Hey2")
            Text("Hey3")
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}

//
//  WelcomeView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void
    
    // MARK: - Body
    var body: some View {
        ZStack {
            welcomeImage
            VStack {
                welcomeTextVStack
                Spacer()
                OnboardingButtonComponentView(title: "Lets get started") {
                    buttonTapped()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .padding(.bottom, 80)
        }
    }
}

// MARK: - Components
extension WelcomeView {
    
    // MARK: - WelcomeImage
    private var welcomeImage: some View {
        Image("OnboardingWelcomeImage")
            .resizable()
            .ignoresSafeArea()
    }
    
    // MARK: - WelcomeTextVStack
    private var welcomeTextVStack: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome")
                .font(.system(size: 64))
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("we’re glad that that")
                Text("you are here")
            }
            .font(.title2)
        }
        .foregroundStyle(Color.onboardingTitleColor)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// MARK: - Preview
#Preview {
    WelcomeView(buttonTapped: {})
}

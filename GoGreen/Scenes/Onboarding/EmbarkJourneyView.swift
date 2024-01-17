//
//  EmbarkJourneyView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct EmbarkJourneyView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void

    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.onboardingBackgroundColor
                .ignoresSafeArea()
            VStack {
                embarkJourneyImage
                embarkJourneyVStack
                fromSucculentsToBlossomsVStack
                Spacer()
                
                OnboardingButtonComponentView(title: "Lets go!") {
                    buttonTapped()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.bottom, 80)
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

// MARK: - Components
extension EmbarkJourneyView {
    
    // MARK: - EmbarkJourneyImage
    private var embarkJourneyImage: some View {
        Image("OnboardingEmbarkJourneyImage")
            .resizable()
            .frame(width: 250, height: 250)
    }
    
    // MARK: - EmbarkJourneyVStack
    private var embarkJourneyVStack: some View {
        VStack {
            Text("Embark on Your Botanical")
            Text("Journey")
        }
        .font(.title)
        .foregroundStyle(Color.onboardingTitleColor)
        .fontWeight(.semibold)
        .padding(.vertical)
    }
    
    // MARK: - FromSucculentsToBlossomsVStack
    private var fromSucculentsToBlossomsVStack: some View {
        VStack {
            Text("From Succulents to Blossoms your")
            Text("green haven unfolds")
        }
        .font(.title2)
        .foregroundStyle(Color.onboardingTitleColor)
    }
    
}

// MARK: - Preview
#Preview {
    EmbarkJourneyView(buttonTapped: {})
}

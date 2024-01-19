//
//  OnboardingButtonComponentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 17.01.24.
//

import SwiftUI

struct OnboardingButtonComponentView: View {
    
    // MARK: - Properties
    let title: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }, label: {
            Text(title)
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.onboardingTitleColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        })    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OnboardingButtonComponentView(title: "Hey", action: {})
}

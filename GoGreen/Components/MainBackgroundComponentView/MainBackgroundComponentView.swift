//
//  MainBackgroundComponentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 03.02.24.
//

import SwiftUI

struct MainBackgroundComponentView: View {
    
    // MARK: - Body
    var body: some View {
        Color(UIColor.mainBackgroundColor ?? UIColor.systemBackground)
            .ignoresSafeArea()
    }
}

// MARK: - Preview
#Preview {
    MainBackgroundComponentView()
}

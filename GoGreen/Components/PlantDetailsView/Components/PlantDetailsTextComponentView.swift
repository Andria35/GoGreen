//
//  PlantDetailsTextComponentView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import SwiftUI

struct PlantDetailsTextComponentView: View {
    
    // MARK: Properties
    let description: String
    let feature: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(description.capitalized)
                .opacity(0.7)
            Text(feature.capitalized)
        }
        .font(.title3)
        .fontWeight(.semibold)
        .lineLimit(0)
    }
}

#Preview {
    PlantDetailsTextComponentView(description: "Name", feature: "Roses")
}

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
        HStack(alignment: .top) {
            Text(description.capitalized + ":")
                .opacity(0.7)
            Text(feature.capitalized)
                .lineLimit(3)

        }
        .font(.title3)
        .fontWeight(.semibold)
    }
}

// MARK: - Preview
#Preview {
    PlantDetailsTextComponentView(description: "Name", feature: "Roses")
}

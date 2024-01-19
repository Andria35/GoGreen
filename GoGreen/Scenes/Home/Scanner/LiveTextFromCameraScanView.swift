//
//  LiveTextFromCameraScanView.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import SwiftUI

struct LiveTextFromCameraScanView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @Binding var liveScan: Bool
    @Binding var scannedText: String
    var fetchPlantsByTextfield: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack {
            DataScannerViewControllerRepresentable(scannedText: $scannedText, liveScan: $liveScan, fetchPlantsByTextfield: fetchPlantsByTextfield)
                .ignoresSafeArea()
            
            Text("Capture Text")
            Button("Cancel") {
                dismiss()
            }.buttonStyle(.borderedProminent)
        }
        .padding(.bottom)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LiveTextFromCameraScanView(liveScan: .constant(false), scannedText: .constant(""), fetchPlantsByTextfield: {})
    }
}

//
//  DataScannerViewControllerRepresentable.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import SwiftUI
import VisionKit

struct DataScannerViewControllerRepresentable: UIViewControllerRepresentable {
    
    // MARK: - Properties
    @Binding var scannedText: String
    @Binding var liveScan: Bool
    var fetchPlantsByTextfield: () -> Void

    // MARK: - Methods
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(recognizedDataTypes: [.text()],
                                                       qualityLevel: .accurate,
                                                       isHighlightingEnabled: true)
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if liveScan {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScannerViewControllerRepresentable
        init(parent: DataScannerViewControllerRepresentable) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                parent.scannedText = text.transcript
                parent.fetchPlantsByTextfield()
                parent.liveScan = false
            default:
                break
            }
        }
        
    }
}

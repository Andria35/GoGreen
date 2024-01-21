//
//  FlowerRecognitionViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 21.01.24.
//

import UIKit
import CoreML
import Vision

final class FlowerRecognitionViewModel {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    // MARK: - Methods
    
    // MARK: - Image Classification
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Cannot import model")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            let classification = request.results?.first as? VNClassificationObservation
            
            print(classification ?? "")
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print("Error")
        }
    }

}

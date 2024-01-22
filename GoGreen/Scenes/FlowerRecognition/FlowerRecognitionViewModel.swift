//
//  FlowerRecognitionViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 21.01.24.
//

import UIKit
import CoreML
import Vision
import NetworkManager

protocol FlowerRecognitionViewModelDelegate: AnyObject {
    func fetchCompleted(plant: Plant)
    func displayFlowerRecognitionFailedAlert()
}

final class FlowerRecognitionViewModel {
    
    // MARK: - Properties
    let networkManager: APIServices
    weak var delegate: FlowerRecognitionViewModelDelegate? = nil
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
    }
    
    // MARK: - Image Classification
    func detectPlant(image: UIImage) {
        
        guard let convertedCIImage = CIImage(image: image) else {
            delegate?.displayFlowerRecognitionFailedAlert()
            return
        }
        guard let model = try? VNCoreMLModel(for: FlowerClassifier(configuration: MLModelConfiguration()).model) else {
            delegate?.displayFlowerRecognitionFailedAlert()
            return
        }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let self else { return }
            
            let classification = request.results?.first as? VNClassificationObservation
            Task {
                await self.fetchPlants(by: classification?.identifier ?? "")
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: convertedCIImage)
        
        do {
            try handler.perform([request])
        } catch {
            delegate?.displayFlowerRecognitionFailedAlert()
            print(error)
        }
    }
    
    // MARK: - API Calls
    private func fetchPlants(by parameter: String) async {
        let apiKey = "oeFJyqfUxBwv_s2Pg_DmjFCFVHZ53xsrbhPRPqi8YBc"
        let urlString = "https://trefle.io/api/v1/plants/search?q=\(parameter)&token=\(apiKey)"
        do {
            let plantsResponse: PlantsResponse = try await networkManager.fetchData(fromURL: urlString)
            if let plant = plantsResponse.data.first {
                await MainActor.run {
                    delegate?.fetchCompleted(plant: plant)
                }
            }
        } catch {
            delegate?.displayFlowerRecognitionFailedAlert()
            print(error)
        }
    }
}

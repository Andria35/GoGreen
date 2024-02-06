//
//  MockNetworkManager.swift
//  GoGreenTests
//
//  Created by Andria Inasaridze on 06.02.24.
//

import UIKit
@testable import GoGreen
@testable import NetworkManager


class MockNetworkManager: APIServices {
    
    var fetchDataCallCounter = 0
    var fetchImageCallCounter = 0
    
    func fetchData<T>(fromURL urlString: String) async throws -> T where T : Decodable {
        fetchDataCallCounter += 1
        if let response = PlantsResponse(data: [PlantMockData.plant]) as? T {
            return response
        }  else {
            throw NSError(domain: "MockNetworkManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch data"])
        }
    }
    
    func fetchImage(fromURL urlString: String) async throws -> UIImage {
        fetchImageCallCounter += 1
        if let image = UIImage(named: "photo") {
            return image
            
        } else {
            throw NSError(domain: "MockNetworkManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch data"])
        }
    }
    
    
}

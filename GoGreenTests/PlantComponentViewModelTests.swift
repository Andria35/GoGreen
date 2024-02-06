//
//  PlantComponentViewModelTests.swift
//  GoGreenTests
//
//  Created by Andria Inasaridze on 06.02.24.
//

import XCTest
@testable import GoGreen

final class PlantComponentViewModelTests: XCTestCase {

    func testInitializer() {
        // Arrange
        let expectation = XCTestExpectation(description: "Fetch Plant image")
        let mockNetworkManager = MockNetworkManager()
        let plantComponentViewModel = PlantComponentViewModel(plant: PlantMockData.plant, networkManager: mockNetworkManager)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        
        // Act
        let result = plantComponentViewModel.plantImage
        let imageCallCount = mockNetworkManager.fetchImageCallCounter
        
        // Assert
        XCTAssertNotNil(result, "Expected value not to be nil")
        XCTAssertEqual(imageCallCount, 1)
    }
}

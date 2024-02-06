//
//  HomeViewModelTests.swift
//  GoGreenTests
//
//  Created by Andria Inasaridze on 06.02.24.
//

import XCTest
@testable import GoGreen

final class HomeViewModelTests: XCTestCase {

    func testPlantsFamilyIsEmptyEmpty() {
        // Arrange
        let homeViewModel = HomeViewModel(networkManager: MockNetworkManager())
        let plantFamilies: PlantFamilies = PlantFamilies(roses: [], sunflowers: [], jasmines: [], daisies: [], irises: [])
        homeViewModel.plantFamilies = plantFamilies
        
        // Act
        let result = homeViewModel.plantsFamilyIsEmpty()
        
        // Assert
        XCTAssertTrue(result, "Expected plant families to be empty")
    }

    func testPlantsFamilyIsEmptyNotEmpty() {
        // Arrange
        let homeViewModel = HomeViewModel(networkManager: MockNetworkManager())
        let plantFamilies = PlantFamilies(roses: [PlantMockData.plant], sunflowers: [], jasmines: [], daisies: [], irises: [])
        homeViewModel.plantFamilies = plantFamilies
        
        // Act
        let result = homeViewModel.plantsFamilyIsEmpty()
        
        // Assert
        XCTAssertFalse(result, "Expected plant families not to be empty")
    }
    
    func testInitializer() {
        // Arrange
        let expectation = XCTestExpectation(description: "Fetch plants")
        let mockNetworkManager = MockNetworkManager()
        let homeViewModel = HomeViewModel(networkManager: mockNetworkManager)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        
        // Act
        let result = homeViewModel.plantFamilies
        
        // Assert
        XCTAssertEqual(result.daisies.count, 1)
        XCTAssertEqual(result.irises.count, 1)
        XCTAssertEqual(result.jasmines.count, 1)
        XCTAssertEqual(result.roses.count, 1)
        XCTAssertEqual(result.sunflowers.count, 1)
        XCTAssertEqual(mockNetworkManager.fetchDataCallCounter, 5)
    }
    
    func testFetchPlantsByTextfieldResult() {
        // Arrange
        let mockNetworkManager = MockNetworkManager()
        let homeViewModel = HomeViewModel(networkManager: mockNetworkManager)
        
        // Act
        let expectation = XCTestExpectation(description: "Fetch searchResult")
        homeViewModel.fetchPlantsByTextfieldResult()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        let result = homeViewModel.searchResult
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(mockNetworkManager.fetchDataCallCounter, 6)
    }

}

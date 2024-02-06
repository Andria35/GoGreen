//
//  HomeViewModelTests.swift
//  GoGreenTests
//
//  Created by Andria Inasaridze on 06.02.24.
//

import XCTest
@testable import GoGreen
@testable import NetworkManager

final class HomeViewModelTests: XCTestCase {

    var homeViewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        homeViewModel = HomeViewModel(networkManager: NetworkManager())
    }

    override func tearDownWithError() throws {
        homeViewModel = nil
    }
    
    func testPlantsFamilyIsEmptyEmpty() {
        // Arrange
        let plantFamilies: PlantFamilies = PlantFamilies(roses: [], sunflowers: [], jasmines: [], daisies: [], irises: [])
        homeViewModel.plantFamilies = plantFamilies
        
        // Act
        let result = homeViewModel.plantsFamilyIsEmpty()
        
        // Assert
        XCTAssertTrue(result, "Expected plant families to be empty")
    }

    func testPlantsFamilyIsEmptyNotEmpty() {
        // Arrange
        let plantFamilies = PlantFamilies(roses: [PlantMockData.plant], sunflowers: [], jasmines: [], daisies: [], irises: [])
        homeViewModel.plantFamilies = plantFamilies
        
        // Act
        let result = homeViewModel.plantsFamilyIsEmpty()
        
        // Assert
        XCTAssertFalse(result, "Expected plant families not to be empty")
    }

}

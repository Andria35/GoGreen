//
//  PlantDetails.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import Foundation

// MARK: - PlantDetailsResponse
struct PlantDetailsResponse: Codable {
    let data: PlantDetails
}

// MARK: - PlantDetails
struct PlantDetails: Codable {
    let id: Int
    let commonName: String?
    let  scientificName: String?
    let imageURL: String?
    let year: Int?
    let bibliography: String?
    let author: String?
    let observations: String?
    let mainSpecies: MainSpecies?
    
    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case imageURL = "image_url"
        case year, bibliography, author
        case observations
        case mainSpecies = "main_species"
    }
}


// MARK: - MainSpecies
struct MainSpecies: Codable {
    let genus: String?
    let family: String?
    let edible: Bool?
}


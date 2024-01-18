//
//  PlantMockData.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import Foundation

struct PlantMockData {
    
    static let plant: Plant = Plant(
        id: 1,
        commonName: "Mock Plant",
        slug: "mock-plant",
        scientificName: "Mockius plantae",
        year: 2022,
        bibliography: "Mock Bibliography",
        author: "Mock Author",
        status: .accepted,
        rank: .species,
        familyCommonName: "Mock Family",
        genusID: 101,
        imageURL: "https://d2seqvvyy3b8p2.cloudfront.net/40ab8e7cdddbe3e78a581b84efa4e893.jpg",
        synonyms: ["Mock Synonym 1", "Mock Synonym 2"],
        genus: "Mock Genus",
        family: "Mock Family",
        links: DatumLinks(
            linksSelf: "https://example.com/api/plants/1",
            plant: "https://example.com/api/plants/1",
            genus: "https://example.com/api/genus/101"
        )
    )

    // You can use this mock data for testing purposes or as a placeholder until you retrieve actual data from the API.

}

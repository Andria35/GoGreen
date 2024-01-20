//
//  PlantDetailsMockData.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 19.01.24.
//

import Foundation

struct PlantDetailsMockData {
    static let plantDetails = PlantDetails(
        id: 143205,
        commonName: "Mock Common Name",
        scientificName: "Mock Scientific Name",
        imageURL: "https://bs.plantnet.org/image/o/778d1f24825a3976fb1f3f9da570ed2401e75931",
        year: 2022,
        bibliography: "Mock Bibliography",
        author: "Mock Author",
        observations: "Mock Observations",
        mainSpecies: MainSpecies(
            genus: "Mock Genus",
            family: "Mock Family",
            edible: true
        )
    )
}

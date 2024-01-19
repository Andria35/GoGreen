//
//  Plant.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 18.01.24.
//

import Foundation

// MARK: - PlantsResponse
struct PlantsResponse: Decodable {
    let data: [Plant]
}

// MARK: - Datum
struct Plant: Decodable, Identifiable {
    let id: Int
    let commonName: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case imageURL = "image_url"
    }
}

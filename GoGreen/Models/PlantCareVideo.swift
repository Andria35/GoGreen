//
//  PlantCareVideo.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 08.02.24.
//

import Foundation

// MARK: - PlantCareVideoResponse
struct PlantCareVideoResponse: Decodable {
    let items: [PlantCareVideo]
}

// MARK: - Item
struct PlantCareVideo: Decodable {
    let id: ID
    let snippet: Snippet?
}

// MARK: - ID
struct ID: Decodable {
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
    }
}

// MARK: - Snippet
struct Snippet: Decodable {
    let title, description: String?
    let thumbnails: Thumbnails?

}

// MARK: - Thumbnails
struct Thumbnails: Decodable {
    let thumbnailsDefault, medium, high: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Decodable {
    let url: String?
    let width, height: Int?
}


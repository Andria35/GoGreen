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
    let title: String?
    let thumbnails: Thumbnails?

}

// MARK: - Thumbnails
struct Thumbnails: Decodable {
    let medium: Default?
}

// MARK: - Default
struct Default: Decodable {
    let url: String?
}


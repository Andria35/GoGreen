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
    let links: PlantsResponseLinks
    let meta: Meta
}

// MARK: - Datum
struct Plant: Decodable, Identifiable {
    let id: Int
    let commonName, slug, scientificName: String
    let year: Int
    let bibliography, author: String
    let status: Status
    let rank: Rank
    let familyCommonName: String?
    let genusID: Int
    let imageURL: String
    let synonyms: [String]
    let genus, family: String
    let links: DatumLinks

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case slug
        case scientificName = "scientific_name"
        case year, bibliography, author, status, rank
        case familyCommonName = "family_common_name"
        case genusID = "genus_id"
        case imageURL = "image_url"
        case synonyms, genus, family, links
    }
}

// MARK: - DatumLinks
struct DatumLinks: Decodable {
    let linksSelf, plant, genus: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case plant, genus
    }
}

enum Rank: String, Decodable {
    case species = "species"
}

enum Status: String, Decodable {
    case accepted = "accepted"
}

// MARK: - PlantsResponseLinks
struct PlantsResponseLinks: Decodable {
    let linksSelf, first, next, last: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case first, next, last
    }
}

// MARK: - Meta
struct Meta: Decodable {
    let total: Int
}

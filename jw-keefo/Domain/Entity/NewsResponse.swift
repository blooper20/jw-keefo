//
//  HomeResponses.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation

// MARK: - HomeResponses
struct NewsResponse: Codable {
    let statusCode: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let created: String
    let status: Bool
    let name, artist: String
    let regionID: Int
    let bannerImage: String
    let eventType: String
    let link: String
    let isVisible: Bool
    let eventTag: [EventTag]
    let eventHomeMaster: [EventHomeMaster]

    enum CodingKeys: String, CodingKey {
        case id, created, status, name, artist
        case regionID = "regionId"
        case bannerImage, eventType, link, isVisible, eventTag, eventHomeMaster
    }
}

// MARK: - EventHomeMaster
struct EventHomeMaster: Codable {
    let id: Int
    let created: String
    let status: Bool
    let eventID, homeMasterID: Int
    let homeMaster: HomeMaster

    enum CodingKeys: String, CodingKey {
        case id, created, status
        case eventID = "eventId"
        case homeMasterID = "homeMasterId"
        case homeMaster
    }
}

// MARK: - HomeMaster
struct HomeMaster: Codable {
    let id: Int
    let created: String
    let status: Bool
    let name: String
    let customerID: Int
    let twitterLink: String
    let purchaseLink: String

    enum CodingKeys: String, CodingKey {
        case id, created, status, name
        case customerID = "customerId"
        case twitterLink, purchaseLink
    }
}

// MARK: - EventTag
struct EventTag: Codable {
    let id: Int
    let tag: String
    let eventID: Int

    enum CodingKeys: String, CodingKey {
        case id, tag
        case eventID = "eventId"
    }
}



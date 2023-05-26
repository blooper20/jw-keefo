//
//  UserResponse.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let statusCode: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let created, modified, deviceID: String
    let profileImageURL: String
    let restorationCode: String
    let countryCode, phone, name, email: JSONNull?
    let password, refreshToken: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, created, modified
        case deviceID = "deviceId"
        case profileImageURL = "profileImageUrl"
        case restorationCode, countryCode, phone, name, email, password, refreshToken
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


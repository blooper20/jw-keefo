//
//  ScanResponse.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation

// MARK: - ScanResponse
struct ScanResponse: Decodable {
    let statusCode: Int?
    let message: String?
    let data: ScanData?
}

// MARK: - ScanData
struct ScanData: Decodable {
    let info: Info?
}

// MARK: - Info
struct Info: Decodable {
    let advanceReservation: AdvanceReservation?
}

// MARK: - AdvanceReservation
struct AdvanceReservation: Decodable {
    let ticketQuantity: Int?
    let ticketType: String?
    let notes: String?
    let advanceReservationEventDate: [AdvanceReservationEventDate]?
}

// MARK: - AdvanceReservationEventDate
struct AdvanceReservationEventDate: Decodable {
    let eventDate: EventDate?
    let advanceReservationEventSession: [AdvanceReservationEventSession]?
}

// MARK: - EventDate
struct EventDate: Decodable {
    let date: String?
}
// MARK: - AdvanceReservationEventSession
struct AdvanceReservationEventSession: Decodable {
    let eventSession: EventSession?
}

// MARK: - EventSession
struct EventSession: Decodable {
    let name: String?
}

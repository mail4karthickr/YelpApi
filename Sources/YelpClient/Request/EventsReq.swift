//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation

public struct EventsReq {
    let locale: String?
    let offset: Int?
    let limit: Int?
    let sortBy: String?
    let sortOn: String?
    let startDate: Int?
    let endDate: Int?
    let categories: Int?
    let isFree: Bool?
    let location: String?
    let coordinate: Coordinates?
    let radius: Int?
    let excludedEvents: [String]?
}

extension EventsReq: Encodable {}

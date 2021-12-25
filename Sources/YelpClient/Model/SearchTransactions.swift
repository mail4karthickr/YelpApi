//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation

public struct SearchTransactions: Codable {
    let total: Int
    let businesses: [Business]
}

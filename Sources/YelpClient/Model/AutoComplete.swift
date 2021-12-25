import Foundation

// MARK: - AutoComplete
public struct AutoComplete: Codable {
    let terms: [Term]
    let businesses: [MiniBusiness]
    let categories: [YelpCategory]
}

// MARK: - Business
struct MiniBusiness: Codable {
    let name: String?
    let id: String
    let text: String?
}

// MARK: - Term
struct Term: Codable {
    let text: String
}

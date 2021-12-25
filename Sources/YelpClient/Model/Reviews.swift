import Foundation

// MARK: - Reviews
public struct Reviews: Codable {
    let reviews: [Review]
    let total: Int
    let possibleLanguages: [String]

    enum CodingKeys: String, CodingKey {
        case reviews, total
        case possibleLanguages = "possible_languages"
    }
}

// MARK: - Review
struct Review: Codable {
    let id: String
    let rating: Int
    let user: User
    let text, timeCreated: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, rating, user, text
        case timeCreated = "time_created"
        case url
    }
}

// MARK: - User
struct User: Codable {
    let id: String
    let profileURL: String
    let imageURL: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case profileURL = "profile_url"
        case imageURL = "image_url"
        case name
    }
}

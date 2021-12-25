import Foundation

struct Business: Codable {
    let rating: Double
    let price: String?
    let phone: String
    let id: String
    let alias: String
    let isClosed: Bool
    let categories: [YelpCategory]
    let reviewCount: Int
    let name: String
    let url: URL
    let coordinates: Coordinates
    let imageUrl: URL
    let location: Location
    let distance: Double
    let transactions: [String]

    enum BusinessCodingKeys: String, CodingKey {
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case imageUrl = "image_url"
    }
}

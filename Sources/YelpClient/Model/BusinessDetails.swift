import Foundation

// MARK: - BusinessDetails
public struct BusinessDetails: Codable {
    let id, alias, name: String
    let imageURL: String
    let isClaimed, isClosed: Bool
    let url: String
    let phone, displayPhone: String
    let reviewCount: Int
    let categories: [YelpCategory]
    let rating: Double
    let location: Location
    let coordinates: Coordinates
    let photos: [String]
    let price: String
    let hours: [Hour]
    let transactions: [String]
    let specialHours: [SpecialHour]

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClaimed = "is_claimed"
        case isClosed = "is_closed"
        case url, phone
        case displayPhone = "display_phone"
        case reviewCount = "review_count"
        case categories, rating, location, coordinates, photos, price, hours, transactions
        case specialHours = "special_hours"
    }
}

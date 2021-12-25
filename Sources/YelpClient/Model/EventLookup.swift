import Foundation

// MARK: - Welcome
public struct EventLookup: Codable {
    let attendingCount: Int?
    let category: String
    let cost, costMax: Int?
    let welcomeDescription: String
    let eventSiteURL: String?
    let id: String
    let imageURL: String?
    let interestedCount: Int?
    let isCanceled: Bool
    let isFree, isOfficial: Bool
    let latitude, longitude: Double
    let name: String
    let ticketsURL: String
    let timeEnd, timeStart: Date
    let location: Location
    let businessID: String

    enum CodingKeys: String, CodingKey {
        case attendingCount = "attending_count"
        case category, cost
        case costMax = "cost_max"
        case welcomeDescription = "description"
        case eventSiteURL = "event_site_url"
        case id
        case imageURL = "image_url"
        case interestedCount = "interested_count"
        case isCanceled = "is_canceled"
        case isFree = "is_free"
        case isOfficial = "is_official"
        case latitude, longitude, name
        case ticketsURL = "tickets_url"
        case timeEnd = "time_end"
        case timeStart = "time_start"
        case location
        case businessID = "business_id"
    }
}

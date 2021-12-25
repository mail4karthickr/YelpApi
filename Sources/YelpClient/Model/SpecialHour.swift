
// MARK: - SpecialHour
struct SpecialHour: Codable {
    let date: String
    let isClosed: Bool
    let start, end: String
    let isOvernight: Bool

    enum CodingKeys: String, CodingKey {
        case date
        case isClosed = "is_closed"
        case start, end
        case isOvernight = "is_overnight"
    }
}

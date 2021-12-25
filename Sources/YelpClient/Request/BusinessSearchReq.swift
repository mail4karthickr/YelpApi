import Foundation

public struct BusinessSearchReq {
    let term: String
    let locationEither: LocationEither
    let radius: Int?
    let categories: String?
    let limit: Int?
    let offset: Int?
    let sortyBy: String?
    let price: String?
    let openNow: String?
    let openAt: String?
    let attributes: String?

    public init(
        term: String,
        locationEither: LocationEither,
        radius: Int? = nil,
        categories: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        sortyBy: String? = nil,
        price: String? = nil,
        openNow: String? = nil,
        openAt: String? = nil,
        attributes: String? = nil
    ) {
        self.term = term
        self.locationEither = locationEither
        self.radius = radius
        self.categories = categories
        self.limit = limit
        self.offset = offset
        self.sortyBy = sortyBy
        self.price = price
        self.openNow = openNow
        self.openAt = openAt
        self.attributes = attributes
    }
    
}

extension BusinessSearchReq: Encodable {
    enum CodingKeys: String, CodingKey {
        case term
        case location
        case latitude
        case longitude
        case radius
        case categories
        case limit
        case offset
        case sortyBy
        case price
        case openNow
        case openAt
        case attributes
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(term, forKey: .term)
        if case .location(let location) = locationEither {
            try container.encode(location, forKey: .location)
        } else if case .coordinate(let coordinate) = locationEither {
            try container.encode(coordinate.latitude, forKey: .latitude)
            try container.encode(coordinate.longitude, forKey: .longitude)
        }
        try container.encodeIfPresent(radius, forKey: .radius)
        try container.encodeIfPresent(categories, forKey: .categories)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(sortyBy, forKey: .sortyBy)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(openNow, forKey: .openNow)
        try container.encodeIfPresent(openAt, forKey: .openAt)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }
}

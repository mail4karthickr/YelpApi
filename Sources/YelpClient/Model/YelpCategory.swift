
public struct YelpCategory {
    public let alias: String
    public let title: String
    public let parentAliases: [String]?
    public let countryWhitelist: [String]?
    public let countryBlacklist: [String]?
    
    public init(
        alias: String,
        title: String,
        parentAliases: [String]? = nil,
        countryWhitelist: [String]? = nil,
        countryBlacklist: [String]? = nil
    ) {
        self.alias = alias
        self.title = title
        self.parentAliases = parentAliases
        self.countryWhitelist = countryWhitelist
        self.countryBlacklist = countryBlacklist
    }
    
}

extension YelpCategory: Codable {
    public enum CategoriesCodingKeys: String, CodingKey {
        case parentAliases = "parent_aliases"
        case countryWhitelist = "country_whitelist"
        case countryBlacklist = "country_blacklist"
    }
}

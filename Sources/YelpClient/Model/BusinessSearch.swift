import Foundation

public struct BusinessSearch: Codable {
    let total: Int
    let businesses: [Business]
    let region: Region
}

import Foundation

struct Item: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let imageUrl: String?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "uniqueNumber"
        case name
        case price
        case imageUrl
        case count
    }
}

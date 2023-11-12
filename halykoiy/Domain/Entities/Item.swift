import Foundation

struct Item: Codable {
    let uniqueNumber: Int
    let name: String
    let price: Int
    let imageUrl: String?
}

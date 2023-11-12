import Foundation

struct Inventory: Codable {
    let price: Int
    let total: Int
    let lowStock: Int
    let outOfStock: Int
}

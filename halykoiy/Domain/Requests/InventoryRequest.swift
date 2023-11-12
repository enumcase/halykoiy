import Foundation

enum InventoryRequest: JSONRequest {
    struct AddInventoryParameter: Codable {
        let itemId: Int
        let count: Int
    }
    
    case inventory
    
    var path: String {
        switch self {
        case .inventory:
            return "/inventory"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

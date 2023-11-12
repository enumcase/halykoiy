import Foundation

enum ItemRequest: JSONRequest {
    struct Parameter: Codable {
        let uniqueNumber: Int
        let name: String
        let price: Int
        let imageUrl: String?
    }
    
    case addItem
    case getItems
    
    var path: String {
        switch self {
        case .addItem, .getItems:
            return "/items"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

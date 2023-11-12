import Foundation

enum AddItemRequest: JSONRequest {
    struct Parameter: Codable {
        let uniqueNumber: Int
        let name: String
        let price: Int
        let imageUrl: String?
    }
    
    case addItem
    
    var path: String {
        switch self {
        case .addItem:
            return "/items"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

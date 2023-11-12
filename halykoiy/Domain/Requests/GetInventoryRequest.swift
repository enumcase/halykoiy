import Foundation

enum GetInventoryRequest: JSONRequest {
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

public enum TabItem: Int, CaseIterable, Hashable {
    case main = 0
    case transactions = 1
    case services = 2
    case more = 3
}

public extension TabItem {
    var title: String {
        switch self {
        case .main:
            return "Main page"
            
        case .transactions:
            return "Transactions"
            
        case .services:
            return "Services"

        case .more:
            return "More"
        }
    }

    var icon: ImageAsset {
        switch self {
        case .main:
            return .main
            
        case .transactions:
            return .transactions
            
        case .services:
            return .services

        case .more:
            return .more
        }
    }
}

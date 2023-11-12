import Foundation
import Combine

final class InventoryRepository {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func getInventory() -> ResultPublisher<Inventory> {
        let request = GetInventoryRequest.inventory
        return session.load(request: request)
    }
}

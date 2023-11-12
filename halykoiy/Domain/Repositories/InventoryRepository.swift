import Foundation
import Combine

final class InventoryRepository {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func getInventory() -> ResultPublisher<Inventory> {
        let request = InventoryRequest.inventory
        return session.load(request: request)
    }
    
    func addItem(item: Item) -> ResultPublisher<EmptyResponse> {
        let request = InventoryRequest.inventory
        let parameter = InventoryRequest.AddInventoryParameter(itemId: item.id, count: item.count ?? 0)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        return session.post(request: request)
    }
}

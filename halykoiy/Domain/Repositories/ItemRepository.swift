import Foundation
import Combine

final class ItemRepository {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func addItem(item: Item) -> ResultPublisher<Item> {
        let request = AddItemRequest.addItem
        let parameter = AddItemRequest.Parameter(
            uniqueNumber: item.uniqueNumber,
            name: item.name,
            price: item.price,
            imageUrl: item.imageUrl
        )
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        return session.post(request: request, parameters: parameters)
    }
}

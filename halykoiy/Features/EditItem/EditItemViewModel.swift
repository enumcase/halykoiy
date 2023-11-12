import Combine
import Foundation

final class EditItemViewModel: ObservableObject {
    struct State {
        var nameValue = ""
        var qrValue = ""
        var priceValue = ""
        var quantityValue = ""
    }
    
    enum Event {
        case addItem
    }
    
    @Published
    var state: State
    
    private var cancellables = Set<AnyCancellable>()
    private let environment: Env
    
    init(
        environment: Env,
        nameValue: String,
        qrValue: String,
        priceValue: String,
        quantityValue: String
    ) {
        self.environment = environment
        self.state = State(nameValue: nameValue, qrValue: qrValue, priceValue: priceValue, quantityValue: quantityValue)
    }
    
    func send(event: Event, completion: @escaping () -> Void) {
        switch event {
        case .addItem:
            let item = Item(id: Int(state.qrValue) ?? 0, name: state.nameValue, price: Int(state.priceValue) ?? 0, imageUrl: "https://universalele.websites.co.in/obaju-turquoise/img/product-placeholder.png", count: 0)
            addItem(item: item, completion: completion)
        }
    }
    
    func addItem(item: Item, completion: @escaping () -> Void) {
        environment.itemRepository.addItem(item: item)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let response):
                    print("🐰 \(response)")
                    completion()
                case .failure(let error):
                    print("🐹 \(error)")
                }
            }
            .store(in: &cancellables)
    }
}

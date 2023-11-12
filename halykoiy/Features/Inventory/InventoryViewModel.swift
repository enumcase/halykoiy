import Combine
import Foundation

final class InventoryViewModel: ObservableObject, ViewModel {
    struct State {
        var inventory: Inventory? = nil
        var items: [Item] = []
    }
    
    enum Event {
        case load
    }
    
    @Published
    var state = State()
    
    @Published var nameValue = ""
    @Published var qrValue = ""
    @Published var priceValue = ""
    @Published var quantityValue = ""
    
    private var cancellables = Set<AnyCancellable>()
    let environment: Env
    
    init(environment: Env) {
        self.environment = environment
    }
    
    func send(event: Event) {
        switch event {
        case .load:
            loadInventory()
            loadItems()
        }
    }
    
    func loadInventory() {
        environment.inventoryRepository.getInventory()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let inventory):
                    self?.state.inventory = inventory
                case .failure(let error):
                    print("🐹 \(error)")
                }
            }
            .store(in: &cancellables)
    }
    
    func loadItems() {
        environment.itemRepository.getItems()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let response):
                    self?.state.items = response.reversed()
                case .failure(let error):
                    print("🐹 \(error)")
                }
            }
            .store(in: &cancellables)
    }
}

import Combine
import Foundation

final class InventoryViewModel: ObservableObject, ViewModel {
    struct State {
        var inventory: Inventory? = nil
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
}

import Combine
import Foundation

final class ItemsViewModel: ObservableObject {
    struct State {
        var items: [Item] = []
    }
    
    enum Event {
        case loadItems
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    let environment: Env
    
    init(
        environment: Env
    ) {
        self.environment = environment
    }
    
    func send(event: Event) {
        switch event {
        case .loadItems:
            loadItems()
        }
    }
    
    func loadItems() {
        environment.itemRepository.getItems()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let response):
                    self?.state.items = response
                case .failure(let error):
                    print("🐹 \(error)")
                }
            }
            .store(in: &cancellables)
    }
}

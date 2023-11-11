import Combine
import Foundation

final class InventoryViewModel: ObservableObject, ViewModel {
    struct State {
        
    }
    
    enum Event {
        case load
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    private let environment: Env
    
    init(environment: Env) {
        self.environment = environment
    }
    
    func send(event: Event) {
        switch event {
        case .load:
            break
        }
    }
}

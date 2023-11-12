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
            let item = Item(uniqueNumber: Int(state.qrValue) ?? 0, name: state.nameValue, price: Int(state.priceValue) ?? 0, imageUrl: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fpaxchristiusa.org%2Fwp-content%2Fuploads%2F2016%2F01%2Fbanana-31.jpg&tbnid=53q43_1-NuCVOM&vet=12ahUKEwjqoK_Xw72CAxUCPXAKHZAXCiQQMygDegQIARBQ..i&imgrefurl=https%3A%2F%2Fpaxchristiusa.org%2F2016%2F01%2F16%2Ftake-action-embrace-the-banana-challenge%2F&docid=aZIlTHxBE-AifM&w=1500&h=1237&q=banana%20square&ved=2ahUKEwjqoK_Xw72CAxUCPXAKHZAXCiQQMygDegQIARBQ")
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

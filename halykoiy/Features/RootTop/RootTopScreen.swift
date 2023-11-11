import SwiftUI

struct RootTopScreen: View {
    @StateObject
    private var router = Router(initial: Route.services, debug: true)
    
    @ObservedObject
    var viewModel: RootTopViewModel
    
    var body: some View {
        RouterHost(router) { route in
            switch route {
            case .signIn:
                Text("Hello")
                
            case .signUp:
                Text("Hello")
                
            case .services:
                InventoryScreen()
                
            case .items(let navTitle):
                ItemsScreen(navTitle: navTitle)
            }
        }
    }
}

import SwiftUI

struct RootTopScreen: View {
    @StateObject
    private var router = Router(initial: Route.signIn, debug: true)
    
    @StateObject
    var viewModel: RootTopViewModel
    
    var body: some View {
        RouterHost(router) { route in
            switch route {
            case .signIn:
                Text("Hello")
                
            case .signUp:
                Text("Hello")
            }
        }
    }
}

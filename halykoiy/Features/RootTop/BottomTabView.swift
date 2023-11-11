import SwiftUI

struct BottomTabView: View {
    @ObservedObject
    private var viewModel: RootTopViewModel
    
    init(viewModel: RootTopViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationBottom(
            viewModel.state.binding(\.tab, event: {
                viewModel.switchTab($0)
            }),
            title: \.title,
            icon: \.icon,
            tabs: TabItem.allCases,
            content: { tab in
                tabPage(tab)
            }
        )
    }
}

private extension BottomTabView {
    func tabPage(_ tab: TabItem) -> some View {
        NavigationView {
            switch tab {
            case .main:
                Text("main")
                
            case .transactions:
                Text("transactions")
                
            case .services:
                Text("services")
                
            case .more:
                Text("more")
            }
        }
    }
}

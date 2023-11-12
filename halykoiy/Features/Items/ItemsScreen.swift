import SwiftUI

struct ItemsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: ItemsViewModel
    
    let navTitle: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.state.items) { item in
                    RecentCard(
                        item: item,
                        environment: viewModel.environment
                    )
                }
            }
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: VStack{
                    backButton
                }
            )
        }
    }
    
    var backButton: some View {
        Button {
            router.pop(animated: true)
        } label: {
            Image(systemName: "arrow.backward")
                .frame(width: 12, height: 12)
                .foregroundColor(Color(.accent))
        }

    }
}

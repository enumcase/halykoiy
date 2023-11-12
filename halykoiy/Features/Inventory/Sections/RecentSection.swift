import SwiftUI

struct RecentSection: View {
    @ObservedObject
    var viewModel: InventoryViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.state.items) { item in
                RecentCard(
                    item: item, environment: viewModel.environment
                )
                .button {
                    
                }
            }
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}


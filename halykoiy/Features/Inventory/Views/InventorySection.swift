import SwiftUI

struct InventorySection<Content: View>: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    let title: String
    let environment: Env
    let shouldShowButton: Bool
    @ObservedObject
    var viewModel: InventoryViewModel
    @ViewBuilder let content: () -> Content
    
    
    init(title: String, environment: Env, shouldShowButton: Bool = false, viewModel: InventoryViewModel, content: @escaping () -> Content) {
        self.title = title
        self.environment = environment
        self.shouldShowButton = shouldShowButton
        self.content = content
        self.viewModel = viewModel
    }
    
    @State var nameValue = ""
    @State var qrValue = ""
    @State var priceValue = ""
    @State var quantityValue = ""
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .bold, design: .default))
                
                Spacer()
                
                if shouldShowButton {
                    addNewItemButton
                }
            }
            
            content()
        }
    }
    
    var addNewItemButton: some View {
        HStack(spacing: 6) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 12, height: 12)
            
            Text("Товар")
                .font(.system(size: 14, weight: .medium, design: .default))
        }
        .button {
            let view = EditItemScreen(viewModel: .init(environment: environment, nameValue: nameValue, qrValue: qrValue, priceValue: priceValue, quantityValue: quantityValue), completion: {
                viewModel.send(event: .load)
            }).environmentObject(router)
            router.presentDialog(view)
        }
        .foregroundColor(.white)
        .padding(4)
        .background(Color(.accent))
        .cornerRadius(8)
    }
}

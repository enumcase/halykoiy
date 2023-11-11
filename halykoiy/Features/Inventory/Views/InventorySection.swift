import SwiftUI

struct InventorySection<Content: View>: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    let title: String
    let shouldShowButton: Bool
    @ViewBuilder let content: () -> Content
    
    init(title: String, shouldShowButton: Bool = false, content: @escaping () -> Content) {
        self.title = title
        self.shouldShowButton = shouldShowButton
        self.content = content
    }
    
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
            let view = EditItemScreen()
            router.presentDialog(view)
        }
        .foregroundColor(.white)
        .padding(4)
        .background(Color(.accent))
        .cornerRadius(8)
    }
}

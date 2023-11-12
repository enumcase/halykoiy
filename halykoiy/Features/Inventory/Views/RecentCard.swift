import SwiftUI

struct RecentCard: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    let item: Item
    let environment: Env
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                CachedAsyncImage(url: URL(string: item.imageUrl ?? "") ?? URL(string:  "https://universalele.websites.co.in/obaju-turquoise/img/product-placeholder.png")!, urlCache: .shared)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                
                Spacer(minLength: 12)
                    .fixedSize()
                
                titleAndCountView
                
                Spacer()
                
                iconAndButtonView
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
    }
    
    var titleAndCountView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(item.name)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium, design: .default))
            
            Text("Цена: \(item.price)")
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .medium, design: .default))
        }
    }
    
    var iconAndButtonView: some View {
        VStack(alignment: .leading, spacing: 16) {
            if item.price >= 0 && item.price <= 100 {
                Image(systemName: "exclamationmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(iconColor)
            }
            
            Menu {
                Button(role: .destructive) {
                    
                } label: {
                    Label("Удалить с инвентаря", systemImage: "trash")
                        .foregroundColor(.red)
                }
                
                Button {
                    let view = EditItemScreen(viewModel: .init(environment: environment, nameValue: item.name, qrValue: String(item.id), priceValue: String(item.price), quantityValue: "0")).environmentObject(router)
                    router.presentDialog(view)
                } label: {
                    Label("Редактировать", systemImage: "square.and.pencil")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium, design: .default))
            }
        }
    }
    
    var iconColor: Color? {
        guard let count = item.count else {
            return nil
        }
        switch count {
        case 0: return .red
        case 1...20: return .yellow
        case 21...100: return Color(.accent)
        default: return nil
        }
    }
}

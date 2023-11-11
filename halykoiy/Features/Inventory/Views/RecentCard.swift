import SwiftUI

struct RecentCard: View {
    let image: String
    let title: String
    let count: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                CachedAsyncImage(url: URL(string: image)!, urlCache: .shared)
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
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium, design: .default))
            
            Text("\(count) в инвентаре")
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .medium, design: .default))
        }
    }
    
    var iconAndButtonView: some View {
        VStack(alignment: .leading, spacing: 16) {
            if count >= 0 && count <= 100 {
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
        switch count {
        case 0: return .red
        case 1...20: return .yellow
        case 21...100: return Color(.accent)
        default: return nil
        }
    }
}


struct RecentCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentCard(image: "https://lh3.googleusercontent.com/x_RRi8ncKIYeB1Jff4Wp6TR4b-cyQpPWbhkci730X4jWtTAzebQ4S7dP0J4AGt813XA_ifQWPwOL59oMlKG7qijXHRfuDT7zoftfHL8JvQGukmk_=w380-nu-rj-l70-e365", title: "ABC", count: 12)
    }
}

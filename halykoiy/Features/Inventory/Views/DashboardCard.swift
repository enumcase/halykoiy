import SwiftUI

struct DashboardCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Spacer()
                
                Text(description)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .medium, design: .default))
            }
            
            Text(title)
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .medium, design: .default))
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
    }
}


struct DashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCard(icon: ImageAsset.services.rawValue, title: "ABC", description: "12122")
    }
}

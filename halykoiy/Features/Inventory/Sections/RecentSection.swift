import SwiftUI

struct RecentSection: View {
    let recentItems = [1,2,3,4]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<5) { _ in
                RecentCard(
                    image: "https://lh3.googleusercontent.com/x_RRi8ncKIYeB1Jff4Wp6TR4b-cyQpPWbhkci730X4jWtTAzebQ4S7dP0J4AGt813XA_ifQWPwOL59oMlKG7qijXHRfuDT7zoftfHL8JvQGukmk_=w380-nu-rj-l70-e365",
                    title: "AB",
                    count: Int.random(in: 0...200)
                )
                .button {
                    
                }
            }
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}


struct RecentSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentSection()
    }
}

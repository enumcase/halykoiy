import SwiftUI

struct ItemsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    let navTitle: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(0..<5) { _ in
                    RecentCard(
                        image: "https://lh3.googleusercontent.com/x_RRi8ncKIYeB1Jff4Wp6TR4b-cyQpPWbhkci730X4jWtTAzebQ4S7dP0J4AGt813XA_ifQWPwOL59oMlKG7qijXHRfuDT7zoftfHL8JvQGukmk_=w380-nu-rj-l70-e365",
                        title: "ABC",
                        count: 12
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

struct ItemsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ItemsScreen(navTitle: "ABC")
    }
}

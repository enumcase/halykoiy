import Foundation
import SwiftUI

struct ServiceScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                // Services Header
                Text("Services")
                    .font(.largeTitle)
                    .padding()

                // Grid for services
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ServiceButton(label: "Accept")
                    ServiceButton(label: "Cards")
                    ServiceButton(label: "Current account")
                    ServiceButton(label: "Deposit")
                    ServiceButton(label: "Guarantees")
                    ServiceButton(label: "New Feature")
                }
                .padding()

                Spacer()

                // Bottom Bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "house")
                        Text("Main")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.right.arrow.left")
                        Text("Transaction")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "gear")
                        Text("Service")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                }
                .padding()
            }
        }
    }
}

// Reusable button for the service grid
struct ServiceButton: View {
    var label: String

    var body: some View {
        Button(action: {}) {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct ServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        ServiceScreen()
    }
}

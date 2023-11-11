import Foundation
import SwiftUI

struct ServiceScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @State var showWebView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Services Header
                Text("Services")
                    .font(.title)
                    .padding()
                
                let recommend = Image("recommend")
                
                recommend
                    .resizable()
                    .frame(width: 390, height: 60)
                    .padding(.top, -15)
                
                let accept = Image("accept")
                let cards = Image("cards")
                let current = Image("current")
                let deposit = Image("deposit")
                let guaranties = Image("guaranties")
                let maps = Image("maps")
                
                
                // Grid for services
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        accept
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 160, height: 160)
                        
                        cards
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 160, height: 160)
                        
                        current
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 160, height: 160)
                        deposit
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 160, height: 160)
                        guaranties
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 160, height: 160)
                        
                        ZStack(alignment: .top){
                            maps
                                .resizable()
                                .cornerRadius(25)
                                .frame(width: 160, height: 160)
                            VStack(alignment: .leading){
                                
                                Spacer()
                                    .fixedSize()
                                
                                Text("Region analysis")
                                    .font(.custom("Open Sans", size: 16))
                                    .padding(.top, 1)
                                
                                Spacer()
                                    .fixedSize()
                                
                                Text("Become the wolf of the market")
                                    .font(.custom("Open Sans", size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                        }
                        .button {
                            showWebView = true
                        }
                    }
                    .padding()
                    
                    
                }
                Spacer()
                
                
            }
            .sheet(isPresented: $showWebView) {
                NavigationStack {
                    WebView(url: URL(string: "https://angular-halyk.vercel.app/")!)
                        .ignoresSafeArea()
                        .navigationTitle("Region analysis")
                        .navigationBarTitleDisplayMode(.inline)
                }
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

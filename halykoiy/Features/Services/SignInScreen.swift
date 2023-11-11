import SwiftUI

public struct SignInScreen: View {
    
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject
    private var router: Router<Route>
    
    //    @StateObject
    //    private var viewModel = SignInViewModel()
    
    
    
    
    public var body: some View {
        NavigationView {
            VStack{
                //header
                VStack{
                    (
                        
                        Text("O")
                            .foregroundColor(.orange) +
                        
                        
                        Text("NLINEBANK")
                            .foregroundColor(Color.black)
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.leading, -140)
                    .padding(.top, 30)
                    
                    Text("by Halyk")
                        .font(.system(size: 22))
                        .foregroundColor(Color.green)
                        .bold()
                        .padding(.leading, -150)
                    
                    Spacer()
                    
                    SwiftUI.TextField("+7", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .frame(width: 320)
                        .background(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(6)
                        .padding(3)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
                        .font(.custom("Open Sans", size: 18))

                        .shadow(radius: 1)
                    
                    SwiftUI.TextField("Password", text: $password)
                        .keyboardType(.phonePad)
                        .padding()
                        .frame(width: 320)
                        .background(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(6)
                        .padding(3)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
                        .font(.custom("Open Sans", size: 18))

                        .shadow(radius: 1)

                    
                    LargeButton(title: "Login to the bank",
                                backgroundColor: Color.green,
                                foregroundColor: Color.white) {
                        //do smth
                    }
                    
                    Text("or")
                        .backgroundStyle(.gray)
                    
                    LargeButton(title: "Become a customer",
                                backgroundColor: Color.white,
                                foregroundColor: Color.green) {
                        //no need to use it
                    }
                    Spacer()
                    
                    let loan = Image("loan")

                    loan
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 350, height: 130)
    
                }
                
            }
        }
    }
    
    struct SignInScreen_Previews: PreviewProvider {
        static var previews: some View {
            SignInScreen()
        }
    }
}

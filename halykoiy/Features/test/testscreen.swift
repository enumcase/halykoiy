import SwiftUI

struct OnlineBankView: View {
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            // Logo and Title
            HStack {
                Image("logo") // Replace with your logo image
                Text("ONLINEBANK\nby Halyk")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
            }
            .padding()

            // Phone Number Input
            TextField("Enter your phone number", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.phonePad)
                .padding()

            // Login Button
            Button(action: {}) {
                Text("Login to the bank")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()

            Text("or")
            
            // Sign Up Button
            Button(action: {}) {
                Text("Become a customer")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()

            // Loan Section
            VStack {
                Text("Loan of up to KZT 30,000,000 for business development")
                    .fontWeight(.semibold)
                    .padding()

                Button(action: {}) {
                    Text("Get a loan")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            .padding()

            // Bottom Bar
            HStack {
                Button(action: {}) {
                    Image(systemName: "questionmark.circle")
                    Text("Support")
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Outlets")
                }
            }
            .padding()
        }
        .padding()
    }
}

struct OnlineBankView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineBankView()
    }
}

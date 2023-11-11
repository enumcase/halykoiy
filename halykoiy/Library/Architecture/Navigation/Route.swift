import Foundation

// Screens defined here
enum Route: Equatable {
    case signIn
    case signUp
    case services
    case items(navTitle: String)
}

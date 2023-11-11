import SwiftUI

public struct Separator: View {
    public enum Style: CaseIterable {
        case full
        case indented
    }

    private let style: Style

    public init(_ style: Style) {
        self.style = style
    }

    public var body: some View {
        Rectangle()
            .fill(Color.black.opacity(0.5))
            .frame(height: 0.5)
            .padding(.horizontal, style.padding)
    }
}

private extension Separator.Style {
    var padding: CGFloat {
        switch self {
        case .full:
            return 0

        case .indented:
            return 16
        }
    }
}

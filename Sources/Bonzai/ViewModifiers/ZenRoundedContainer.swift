import SwiftUI

struct ZenRoundedContainer: ViewModifier {
  private let cornerRadius: CGFloat
  private let padding: CGFloat
  private let margin: CGFloat

  init(cornerRadius: CGFloat, padding: CGFloat, margin: CGFloat) {
    self.cornerRadius = cornerRadius
    self.padding = padding
    self.margin = margin
  }

  func body(content: Content) -> some View {
    content
      .padding(padding)
      .background(Color(nsColor: .underPageBackgroundColor))
      .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(Color(nsColor: .controlColor).opacity(0.2), lineWidth: 3)
      )
      .background(
        RoundedRectangle(cornerRadius: cornerRadius + 1)
          .stroke(Color(nsColor: .controlColor).opacity(0.4), lineWidth: 1)
          .padding(-1)
      )
      .compositingGroup()
      .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.4), radius: 2, y: 1)
      .padding(margin)
  }
}

public extension View {
  func roundedContainer(_ cornerRadius: CGFloat = 8, padding: CGFloat = 16, margin: CGFloat = 16) -> some View {
    self
      .modifier(ZenRoundedContainer(cornerRadius: cornerRadius, padding: padding, margin: margin))
  }
}

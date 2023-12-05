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
          .stroke(Color(nsColor: .controlColor), lineWidth: 1)
      )
      .padding(margin)
  }
}

public extension View {
  func roundedContainer(_ cornerRadius: CGFloat = 8, padding: CGFloat = 16, margin: CGFloat = 16) -> some View {
    self
      .modifier(ZenRoundedContainer(cornerRadius: cornerRadius, padding: padding, margin: margin))
  }
}
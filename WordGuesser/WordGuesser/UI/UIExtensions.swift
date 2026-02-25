//
//  UIExtensions.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-24.
//

import SwiftUI

extension Animation {
    static let wordGuesser: Animation = .bouncy
    static let guess: Animation = .wordGuesser
    static let restart: Animation = .wordGuesser
    static let selection: Animation = .wordGuesser
}

extension AnyTransition {
    static let keyboard: AnyTransition = .offset(x: 0, y: 200)
    static func attempt(_ isOver: Bool) -> AnyTransition {
        .asymmetric(insertion: isOver ? .opacity : .move(edge: .top), removal: .move(edge: .trailing))
    }
}

//extension ShapeStyle where Self == Color {
//    /// A butter color suitable for use in UI elements.
//    public static var butter: Color {
//        Color(hue: 48/360, saturation: 26/100, brightness: 98/100, opacity: 100/100)
//    }
//}

extension View {
    func flexibleSystemFont(minimum: CGFloat = 8, maximum: CGFloat = 64) -> some View {
        self
            .font(.system(size: maximum, design: .monospaced))
            .minimumScaleFactor(minimum/maximum)
    }
}

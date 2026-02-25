//
//  LetterView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-22.
//

import SwiftUI

struct LetterView: View {
    // MARK: Data In
    let letter: Letter
    var letterColor: Color = .gray
    var displayingLetterStroke: Bool = false
    var overlayContainerDimensions: Bool = false
    
    // MARK: - Body
    
    let letterShape = RoundedRectangle(cornerRadius: 8)
    
    var body: some View {
        letterShape
            .fill(.background)
            .fill(letterColor.opacity(0.25))
            .strokeBorder(displayingLetterStroke ? .gray.opacity(0.5) : .clear)
            .contentShape(letterShape)
            .aspectRatio(3/4, contentMode: .fit)
            .overlay {
                Text(letter)
                    .flexibleSystemFont()
                    .padding(4)

                if overlayContainerDimensions {
                    ContainerDimensionsView()
                }
            }
//            .frame(maxWidth: 36, maxHeight: 48)
//            .frame(maxWidth: 33, maxHeight: 44)
//            .frame(maxWidth: 30, maxHeight: 40)
//            .frame(maxWidth: 27, maxHeight: 36)
//            .frame(maxWidth: 24, maxHeight: 32)
    }
}

#Preview {
    HStack(spacing: 4) {
        LetterView(letter: "W")
        LetterView(letter: "O", letterColor: .green)
        LetterView(letter: "R", letterColor: .yellow)
        LetterView(letter: "D", letterColor: .red)
        LetterView(letter: "S", letterColor: .blue)
        LetterView(letter: "!", overlayContainerDimensions: true)
    }
    // ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
    .aspectRatio(((6*57)+(5*4))/76, contentMode: .fit)
    .frame(maxWidth: 370, maxHeight: 76)
    .frame(minWidth: 343, minHeight: 64)
}

//
//  KeyboardRowView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-24.
//

import SwiftUI

struct KeyboardRowView: View {
    // MARK: Data In
    let letters: [Letter]
    var overlayContainerDimensions: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(letters, id: \.self) { letter in
                Button {
//                        onChoose?(letter)
                    print("key() -> \"\(letter)\"")
                } label: {
                    LetterView(letter: letter, overlayContainerDimensions: overlayContainerDimensions)
                }
                .buttonStyle(.plain)
            }
        }
        // ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
        .aspectRatio(((10*33)+(9*4))/44, contentMode: .fit)
        .frame(maxWidth: 370, maxHeight: 44)
        .frame(minWidth: 343, minHeight: 40)
    }
}

#Preview {
    KeyboardRowView(letters: "QWERTYUIOP".map { Letter($0) }, overlayContainerDimensions: false)
    KeyboardRowView(letters: "QWERTYUIOP".map { Letter($0) }, overlayContainerDimensions: true)
}

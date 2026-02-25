//
//  LetterRowView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-22.
//

import SwiftUI

struct LetterRowView: View {
    // MARK: Data In
    let letters: [Letter]
    var letterColor: Color = .yellow
    var displayingLetterStroke: Bool = true
    var overlayContainerDimensions: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(letters, id: \.self) { letter in
                LetterView(letter: letter, letterColor: letterColor, displayingLetterStroke: displayingLetterStroke, overlayContainerDimensions: overlayContainerDimensions)
            }
        }
        // ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
        .aspectRatio(((6*57)+(5*4))/76, contentMode: .fit)
        .frame(maxWidth: 370, maxHeight: 76)
        .frame(minWidth: 343, minHeight: 64)
    }
}

#Preview {
    LetterRowView(letters: "TESTER".map { Letter($0) }, overlayContainerDimensions: false)
    LetterRowView(letters: "TESTER".map { Letter($0) }, overlayContainerDimensions: true)
}

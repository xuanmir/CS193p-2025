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
    
    var letterAspectRatio: Double = 3/4
    let letterWidth: Double = 57
    let gapWidth: Double = 4
    let maxNumberOfLetters: Double = 6
    private var maxNumberOfGaps: Double {
        maxNumberOfLetters - 1
    }
    private var letterHeight: Double {
        letterWidth / letterAspectRatio
    }
    private var rowAspectRatio: Double {
        // ((6*57)+(5*4))/76
        ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(letters, id: \.self) { letter in
                LetterView(letter: letter, letterAspectRatio: letterAspectRatio, letterColor: letterColor, displayingLetterStroke: displayingLetterStroke, overlayContainerDimensions: overlayContainerDimensions)
            }
        }
        // ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
//        .aspectRatio(((6*57)+(5*4))/76, contentMode: .fit)
//        .frame(maxWidth: 370, maxHeight: 76)
//        .frame(minWidth: 343, minHeight: 64)
        .aspectRatio(rowAspectRatio, contentMode: .fit)
        .frame(maxWidth: 370, maxHeight: letterHeight)
    }
}

#Preview {
    LetterRowView(letters: "TESTER".map { Letter($0) }, overlayContainerDimensions: false)
    LetterRowView(letters: "TESTER".map { Letter($0) }, overlayContainerDimensions: true)
}

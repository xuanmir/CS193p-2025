//
//  GlassKeyboardRowView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-26.
//

import SwiftUI

struct GlassKeyboardRowView: View {
    // MARK: Data In
    let letters: [Letter]
    var overlayContainerDimensions: Bool = false
    
    // MARK: - Body
    
    var letterAspectRatio: Double = 3/4
    let letterWidth: Double = 63
    let gapWidth: Double = 4
    let maxNumberOfLetters: Double = 10
    private var maxNumberOfGaps: Double {
        maxNumberOfLetters - 1
    }
    private var letterHeight: Double {
        letterWidth / letterAspectRatio
    }
    private var rowAspectRatio: Double {
        // ((10*33)+(9*4))/44
        ((maxNumberOfLetters*letterWidth)+(maxNumberOfGaps*gapWidth))/letterHeight
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(letters, id: \.self) { letter in
                Button {
//                    onChoose?(letter)
                    print("key() -> \"\(letter)\"")
                } label: {
                    Text(letter)
                        .flexibleSystemFont()
                        .padding(-4)
                }
                .buttonStyle(.glass)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .aspectRatio(letterAspectRatio, contentMode: .fit)
//                .scaledToFit()
            }
        }
//        .aspectRatio(366/letterHeight, contentMode: .fit)
        .aspectRatio(rowAspectRatio, contentMode: .fit)
        .frame(maxWidth: 370, maxHeight: letterHeight)
        .padding(.vertical, -16)
    }
}

#Preview {
    GlassKeyboardRowView(letters: "QWERTYUIOP".map { Letter($0) })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
}

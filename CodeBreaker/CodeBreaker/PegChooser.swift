//
//  PegChooser.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-02-12.
//

import SwiftUI

struct PegChooser: View {
    // MARK: Data In
    let game: CodeBreaker
    let choices: [Peg]
    
    // MARK: Data Out Function
    let onChoose: ((Peg) -> Void)?
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) { peg in
                Button {
                    onChoose?(peg)
                } label: {
                    PegView(peg: peg, pegType: game.pegType)
                }
            }
        }
    }
}

//#Preview {
//    PegChooser()
//}

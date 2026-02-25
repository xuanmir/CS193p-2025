//
//  CodeView.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-02-12.
//

import SwiftUI

struct CodeView: View {
    // MARK: Data In
    let code: Code
    let game: CodeBreaker
    
    // MARK: Data shared with this View
    @Binding var selection: Int
    
    // MARK: - Body
    
    var body: some View {
        ForEach(code.pegs.indices, id: \.self) { index in
            PegView(peg: code.pegs[index], pegType: game.pegType)
                .padding(Selection.border)
                .background {
                    if selection == index, code.kind == .guess {
                        Selection.shape
                            .foregroundStyle(Selection.shapeStyle)
                    }
                }
                .overlay {
                    Selection.shape.foregroundStyle(code.isHidden ? .gray : .clear)
                }
                .onTapGesture {
                    if code.kind == .guess {
                        selection = index
                    }
                }
        }
    }
    
    struct Selection {
        static let border: CGFloat = 5
        static let cornerRadius: CGFloat = 10
        static let shape = RoundedRectangle(cornerRadius: cornerRadius)
        static let shapeStyle: some ShapeStyle = .quaternary
    }
}

//#Preview {
//    CodeView()
//}

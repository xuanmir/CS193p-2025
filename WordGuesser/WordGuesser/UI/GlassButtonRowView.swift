//
//  GlassButtonRowView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-03-01.
//

import SwiftUI

struct GlassButtonRowView: View {
//    // MARK: Data In
//    @Environment(\.words) var words
    
    // MARK: Data shared with this View
    @Binding var game: WordGuesser
    @Binding var selection: Int
    @Binding var restarting: Bool
    
    @Binding var isShowingContainerDimensions: Bool
    @Binding var isShowingKeyboard: Bool
    
    // MARK: - Body
    
    var body: some View {
        if let newWord = WordGuesserView().randomWord() {
            HStack {
                Button("Restart", role: .destructive) {
                    withAnimation(.restart) {
                        game.wordToGuess = newWord
                    }
                    print("restart() -> { wordToGuess = \"\(game.wordToGuess.word)\" }")
                }
//                Button("Guess") {
//                    withAnimation(.guess) {
//                        // TODO: action
//                    }
//                    print("guess()")
//                }
                Button("Size") {
                    withAnimation(.bouncy) {
                        isShowingContainerDimensions.toggle()
                    }
                    print("dimensions() -> { isShowingContainerDimensions = \(isShowingContainerDimensions) }")
                }
                Button("Keyboard") {
                    withAnimation(.bouncy) {
                        isShowingKeyboard.toggle()
                    }
                    print("keyboard() -> { isShowingKeyboard = \(isShowingKeyboard) }")
                }
            }
//            .buttonBorderShape(.roundedRectangle(radius: 8))
//            .fontWeight(.medium)
//            .overlay {
//                ContainerDimensionsView()
//            }
        }
    }
    
//    func randomWord() -> Word? {
//        if let randomWord = words.randomBetter(length: Int.random(in: 3...6)) {
//            return Word(letters: randomWord.map { Letter($0) })
//        } else {
//            return nil
//        }
//    }
}

//#Preview {
//    GlassButtonRowView()
//}

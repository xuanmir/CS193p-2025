//
//  OldButtonRowView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-03-02.
//

import SwiftUI

struct OldButtonRowView: View {
    // MARK: Data shared with this View
    @Binding var game: WordGuesser
    @Binding var selection: Int
    @Binding var restarting: Bool
    
    @Binding var isShowingContainerDimensions: Bool
    @Binding var isShowingKeyboard: Bool
    
    // MARK: - Body
    
    let rowWidth: Double = 370
    let buttonHeight: Double = 34
    let gapWidth: Double = 8
    let maxNumberOfButtons: Double = 3
    private var maxNumberOfGaps: Double {
        maxNumberOfButtons - 1
    }
    private var buttonWidth: Double {
        ((rowWidth - (gapWidth * maxNumberOfGaps)) / maxNumberOfButtons)
    }
    private var buttonAspectRatio: Double {
        buttonWidth / buttonHeight
    }
    private var rowAspectRatio: Double {
        // 370 / 34
        rowWidth / buttonHeight
    }
    
    var body: some View {
        if let newWord = WordGuesserView().randomWord() {
            HStack(spacing: gapWidth) {
                Button(role: .destructive) {
                    withAnimation(.restart) {
                        game.wordToGuess = newWord
                    }
                    print("restart() -> { wordToGuess = \"\(game.wordToGuess.word)\" }")
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background)
                        .fill(.gray.opacity(0.25))
                        .contentShape(RoundedRectangle(cornerRadius: 8))
                        .aspectRatio(buttonAspectRatio, contentMode: .fit)
                        .overlay {
                            Text("Restart")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                        }
                }
//                Button("Guess") {
//                    withAnimation(.guess) {
//                        // TODO: action
//                    }
//                    print("guess()")
//                }
                Button {
                    withAnimation(.bouncy) {
                        isShowingContainerDimensions.toggle()
                    }
                    print("dimensions() -> { isShowingContainerDimensions = \(isShowingContainerDimensions) }")
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background)
                        .fill(.gray.opacity(0.25))
                        .contentShape(RoundedRectangle(cornerRadius: 8))
                        .aspectRatio(buttonAspectRatio, contentMode: .fit)
                        .overlay {
                            Text("Size")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                        }
                }
                Button {
                    withAnimation(.bouncy) {
                        isShowingKeyboard.toggle()
                    }
                    print("keyboard() -> { isShowingKeyboard = \(isShowingKeyboard) }")
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background)
                        .fill(.gray.opacity(0.25))
                        .contentShape(RoundedRectangle(cornerRadius: 8))
                        .aspectRatio(buttonAspectRatio, contentMode: .fit)
                        .overlay {
                            Text("Keyboard")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                        }
                }
            }
            .buttonStyle(.plain)
            .fontWeight(.semibold)
//            .fontWeight(.medium)
//            .overlay {
//                ContainerDimensionsView()
//            }
//            .aspectRatio(rowAspectRatio, contentMode: .fit)
    //        .overlay {
    //            ContainerDimensionsView()
    //        }
//            .frame(maxWidth: 370, maxHeight: buttonHeight)
        }
    }
}

//#Preview {
//    OldButtonRowView()
//}

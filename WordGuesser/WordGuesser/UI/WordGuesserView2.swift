//
//  WordGuesserView2.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-25.
//

import SwiftUI

struct WordGuesserView2: View {
    // MARK: Data In
    @Environment(\.words) var words
    
    // MARK: Data owned by this View
    @State private var game: WordGuesser = WordGuesser()
    @State private var selection: Int = 0
    @State private var restarting: Bool = false
    
    @State private var isShowingContainerDimensions: Bool = true
    @State private var isShowingKeyboard: Bool = true
    
    // Do we really need this ?
    @State private var containerWidth: Double = 64
    @State private var containerHeight: Double = 64
    
    // MARK: - Body
    
    var body: some View {
        if let newWord = randomWord() {
            VStack {
                LetterRowView(letters: game.wordToGuess.letters)
                
//                LetterRowView(letters: game.wordToGuess.letters, overlayContainerDimensions: true)
                
                Spacer()
                
                if isShowingContainerDimensions {
                    ContainerDimensionsView()
                        .transition(.scale)
                } else {
                    VStack {
                        Text("ScreenDimensions")
                        Text("\(containerWidth.rounded().formatted()) × \(containerHeight.rounded().formatted())")
                    }
                    .padding()
                }
                
//                VStack {
//                    Text("ScreenDimensions")
//                    Text("\(containerWidth.rounded().formatted()) × \(containerHeight.rounded().formatted())")
//                }
//                .padding()
                
                Spacer()
                
                HStack {
                    Button("Restart", role: .destructive) {
                        withAnimation(.restart) {
                            game.wordToGuess = newWord
                        }
                        print("restart() -> { wordToGuess = \"\(game.wordToGuess.word)\" }")
                    }
//                    Button("Guess") {
//                        withAnimation(.guess) {
//                            // TODO: action
//                        }
//                        print("guess()")
//                    }
                    Button("Dimensions") {
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
                .buttonStyle(.bordered)
                // Requires iOS 26.0 or newer
//                .buttonSizing(.flexible)

                if isShowingKeyboard {
                    KeyboardView()
                        .transition(.keyboard)
                    
//                    KeyboardView(overlayContainerDimensions: true)
//                        .transition(.keyboard)
                }
            }
            .padding()
            .task {
                game.wordToGuess = newWord
                print("task() -> { wordToGuess = \"\(game.wordToGuess.word)\" }")
            }
//            .frame(maxWidth: 375, maxHeight: 734) // Simulate iPhone XS screen
            .onGeometryChange(for: CGSize.self ) { geometry in
                geometry.size
            } action: { newValue in
                containerWidth = newValue.width
                containerHeight = newValue.height
            }
        }
    }
    
    func randomWord() -> Word? {
        if let randomWord = words.randomBetter(length: Int.random(in: 3...6)) {
            return Word(letters: randomWord.map { Letter($0) })
        } else {
            return nil
        }
    }
    
    func changeLetterAtSelection(to letter: Letter) {
//        game.setGuessLetter(letter, at: selection)
        selection = (selection + 1) % game.wordToGuess.letters.count
    }
    
    func restart() {
        withAnimation(.restart) {
            restarting = true
        } completion: {
            withAnimation(.restart) {
//                game.restart()
                selection = 0
                restarting = false
            }
        }
    }
    
    func guess() {
        withAnimation(.guess) {
//            game.attemptGuess()
            selection = 0
//            hideMostRecentMarkers = true
        } completion: {
            withAnimation(.guess) {
//                hideMostRecentMarkers = false
            }
        }
    }
}

#Preview {
    WordGuesserView2()
}

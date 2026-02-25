//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-01-12.
//

import SwiftUI

struct CodeBreakerView: View {
    // MARK: Data owned by this View
    @State private var game = CodeBreaker()
    @State private var selection: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        VStack {
//            Text(game.pegType == .colors ? "Colors" : "Emojis")
//                .font(.largeTitle)
//                .fontDesign(.serif)
//                .fontWeight(.bold)
            
            view(for: game.masterCode)
            ScrollView() {
                if !game.isOver {
                    view(for: game.guess)
                }
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    view(for: game.attempts[index])
                }
            }
            
            if !game.isOver {
                PegChooser(game: game, choices: game.pegChoices) { peg in
                    game.setGuessPeg(peg, at: selection)
                    selection = (selection + 1) % game.pegNumber
                }
                .transition(.offset(x: 0, y: 200))
            }
            
//            if game.isOver {
//                Button("Restart") {
//                    withAnimation {
//                        game = CodeBreaker()
//                    }
//                }
//                .buttonStyle(.borderedProminent)
//            }
            
            Button("Restart") {
                withAnimation {
                    game = CodeBreaker()
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
//    var pegChooser: some View {
//        HStack {
//            ForEach(game.pegChoices, id: \.self) { peg in
//                Button {
//                    game.setGuessPeg(peg, at: selection)
//                    selection = (selection + 1) % game.pegNumber
//                } label: {
//                    PegView(peg: peg, pegType: game.pegType)
//                }
//            }
//        }
//    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
                selection = 0
            }
        }
        .font(.system(size: GuessButton.maximumFontSize))
        .minimumScaleFactor(GuessButton.scaleFactor)
    }
    
    func view(for code: Code) -> some View {
        HStack {
            CodeView(code: code, game: game, selection: $selection)
            Color.clear.aspectRatio(1, contentMode: .fit)
                .overlay {
                    if let matches = code.matches {
                        MatchMarkers(matches: matches, pegNumber: game.pegNumber)
                    } else {
                        if code.kind == .guess {
                            guessButton
                        }
                    }
                }
        }
    }
    
    struct GuessButton {
        static let minimumFontSize: CGFloat = 8
        static let maximumFontSize: CGFloat = 80
        static let scaleFactor = minimumFontSize / maximumFontSize
    }
}

#Preview {
    CodeBreakerView()
}

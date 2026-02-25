//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-02-03.
//

import Foundation

typealias Peg = String

enum PegType: CaseIterable, Equatable {
    case colors
    case emojis
}

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master(isHidden: true))
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    var pegChoices: [Peg]
    let pegNumber: Int
    let pegType: PegType
    
    init() {
        self.pegNumber = Int.random(in: 3...6)
        self.pegType = .allCases.randomElement()!
        
        switch pegType {
        case .colors:
//            self.pegChoices = ["blue", "brown", "cyan", "green", "indigo", "orange", "purple", "red", "yellow"]
            self.pegChoices = ["red", "orange", "yellow", "green", "blue", "purple"]
        case .emojis:
//            self.pegChoices = ["😎", "😈", "👻", "❤️", "🦄", "🚀", "🔥", "🐷", "☕"]
            self.pegChoices = ["😎", "❤️", "🦄", "🔥", "🐷", "☕"]
        }
        
        masterCode.randomize(from: pegChoices, numberOfPegs: pegNumber)
//        masterCode.randomize(from: pegChoices)
        guess.pegs = Array(repeating: Code.missingPeg, count: pegNumber)
        
        print(masterCode)
    }
    
    var isOver: Bool {
        attempts.last?.pegs == masterCode.pegs
    }
    
    mutating func attemptGuess() {
        if !attempts.contains(where: { $0.pegs == guess.pegs }) && guess.pegs != Array(repeating: Code.missingPeg, count: pegNumber) {
            var attempt = guess
            attempt.kind = .attempt(guess.match(against: masterCode))
            attempts.append(attempt)
            guess.reset(pegNumber: pegNumber)
            if isOver {
                masterCode.kind = .master(isHidden: false)
            }
        }
    }
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guard guess.pegs.indices.contains(index) else { return }
        guess.pegs[index] = peg
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
}

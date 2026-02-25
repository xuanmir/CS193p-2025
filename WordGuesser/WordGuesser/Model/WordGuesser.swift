//
//  WordGuesser.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-22.
//

import Foundation

typealias Letter = String

struct WordGuesser {
    var wordToGuess: Word
//    var guess: Word = Word(kind: .guess)
    var attempts: [Word] = [Word]()
    let letterChoices: [Letter]
    
//    var wordToGuess: Word {
//        if let randomWord = Words.shared.randomBetter(length: Int.random(in: 3...6)) {
//            return Word(letters: randomWord.map { Letter($0) })
//        } else {
//            return Word(letters: ["W", "O", "R", "D"])
//        }
//    }
    
//    let letterChoices: [Letter] = "QWERTYUIOPASDFGHJKLZXCVBNM".map { Letter($0) }
    
    init() {
        wordToGuess = Word(letters: ["W", "O", "R", "D"])
        letterChoices = "QWERTYUIOPASDFGHJKLZXCVBNM".map { Letter($0) }
    }
    
    var isOver: Bool = false
    
//    init() {
//        wordToGuess = Word(letters: ["W", "O", "R", "D"])
//
//        if let randomWord = randomWord() {
//            wordToGuess = randomWord
//            print("init() -> { wordToGuess = \"\(wordToGuess.word)\" }")
//        }
//    }
    
//    init() {
//        letterChoices = "QWERTYUIOPASDFGHJKLZXCVBNM".map { String($0) }
//        wordToGuess = Word(letters: ["W", "O", "R", "D"])
        
//        if let randomWord = Words.shared.randomBetter(length: Int.random(in: 3...6)) {
//            wordToGuess = Word(letters: randomWord.map { String($0) })
//        } else {
//            wordToGuess = Word(letters: ["W", "O", "R", "D"])
////            wordToGuess = Word(letters: [])
//        }
//    }
    
//    mutating func guessWord(_ guess: Word) {
//        self.guess = guess
//        attempts.append(guess)
//    }
}

//func randomWord() -> Word? {
//    if let randomWord = Words.shared.randomBetter(length: Int.random(in: 3...6)) {
//        return Word(letters: randomWord.map { Letter($0) })
//    } else {
//        return nil
//    }
//}

//var masterCode: Code = Code(kind: .master(isHidden: true))
//var guess: Code = Code(kind: .guess)
//var attempts: [Code] = [Code]()
//var pegChoices: [Peg]
//let pegNumber: Int
//let pegType: PegType

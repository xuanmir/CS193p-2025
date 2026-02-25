//
//  Code.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-02-10.
//

import Foundation

struct Code {
    var kind: Kind
    var pegs: [Peg] = Array(repeating: Code.missingPeg, count: 4)
    
    static let missingPeg: Peg = "clear"
    
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt([Match])
        case unknown
    }
    
//    mutating func randomize(from pegChoices: [Peg], numberOfPegs pegNumber: Int) {
//        pegs = Array(repeating: Code.missingPeg, count: pegNumber)
//        for index in pegChoices.indices where index < pegNumber {
//            pegs[index] = pegChoices.randomElement() ?? Code.missingPeg
//        }
//    }
    mutating func randomize(from pegChoices: [Peg], numberOfPegs pegNumber: Int) {
        pegs = Array(repeating: Code.missingPeg, count: pegNumber)
        for index in pegs.indices where index < pegNumber {
            pegs[index] = pegChoices.randomElement() ?? Code.missingPeg
        }
    }
//    mutating func randomize(from pegChoices: [Peg]) {
//        for index in pegs.indices {
//            pegs[index] = pegChoices.randomElement() ?? Code.missingPeg
//        }
//    }
    
    var isHidden: Bool {
        switch kind {
        case .master(let isHidden):
            return isHidden
        default:
            return false
        }
    }
    
    mutating func reset(pegNumber: Int) {
        pegs = Array(repeating: Code.missingPeg, count: pegNumber)
    }
    
    var matches: [Match]? {
        switch kind {
        case .attempt(let matches):
            return matches
        default:
            return nil
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var pegsToMatch: [Peg] = otherCode.pegs
        
        let exactMatches: [Match] = pegs.indices.reversed().map { index in
            if pegsToMatch.count > index, pegsToMatch[index] == pegs[index] {
                pegsToMatch.remove(at: index)
                return .exact
            } else {
                return .nomatch
            }
        }
        
        return pegs.indices.map { index in
            if exactMatches[index] != .exact, let matchIndex = pegsToMatch.firstIndex(of: pegs[index]) {
                pegsToMatch.remove(at: matchIndex)
                return .inexact
            } else {
                return exactMatches[index]
            }
        }
    }
}

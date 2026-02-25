//
//  Word.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-22.
//

import Foundation

struct Word {
//    var kind: Kind
    var letters: [Letter] = Array(repeating: Word.missingLetter, count: 4)
    
    static let missingLetter: Letter = ""
    
    var word: String {
        get { letters.joined() }
        set { letters = newValue.map { Letter($0) } }
    }
}

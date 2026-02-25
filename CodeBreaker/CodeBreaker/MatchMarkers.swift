//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-01-26.
//

import SwiftUI

enum Match {
    case nomatch, exact, inexact
}

struct MatchMarkers: View {
    // MARK: Data In
    let matches: [Match]
    let pegNumber: Int
    
    // MARK: - Body
    
    var body: some View {
//        HStack {
//            VStack {
//                matchMarker(peg: 0)
//                matchMarker(peg: 1)
//            }
//            VStack {
//                matchMarker(peg: 2)
//                matchMarker(peg: 3)
//            }
//            VStack {
//                matchMarker(peg: 4)
//                matchMarker(peg: 5)
//            }
//        }
        
        LazyVGrid(columns: pegNumber < 5 ? [GridItem(), GridItem()] : [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<pegNumber, id: \.self) { number in
                matchMarker(peg: number)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .nomatch }
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

func row(colors: Array<Color>, matches: Array<Match>, pegNumber: Int) -> some View {
    HStack {
        ForEach(colors.indices, id: \.self) { index in
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(colors[index])
        }
        MatchMarkers(matches: matches, pegNumber: pegNumber)
    }
}

#Preview {
    VStack {
        row(
            colors: [.red, .green, .blue],
            matches: [.exact, .inexact, .inexact],
            pegNumber: 3
        )
        row(
            colors: [.teal, .orange, .yellow, .green],
            matches: [.exact, .nomatch, .inexact, .exact],
            pegNumber: 4
        )
        row(
            colors: [.yellow, .purple, .red, .teal, .orange],
            matches: [.exact, .inexact, .exact, .inexact, .inexact],
            pegNumber: 5
        )
        row(
            colors: [.red, .green, .blue, .yellow, .purple, .teal],
            matches: [.exact, .inexact, .exact, .nomatch, .inexact, .exact],
            pegNumber: 6
        )
    }
    .padding()
}

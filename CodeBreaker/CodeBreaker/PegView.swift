//
//  PegView.swift
//  CodeBreaker
//
//  Created by Juan Diosdado on 2026-02-10.
//

import SwiftUI

struct PegView: View {
    // MARK: Data In
    let peg: Peg
    let pegType: PegType
    
    // MARK: - Body
    
    let pegShape = Circle()
//    let pegShape = RoundedRectangle(cornerRadius: 10)

    var body: some View {
//        pegShape
//            .overlay {
//                if peg == Code.missingPeg {
//                    pegShape
//                        .strokeBorder(.gray)
//                }
//            }
//            .contentShape(pegShape)
//            .aspectRatio(1, contentMode: .fit)
//            .foregroundStyle(colorFromString(peg))
        
        pegShape
            .foregroundStyle(colorFromString(peg))
            .overlay {
                switch pegType {
                case .colors:
                    if peg == Code.missingPeg {
                        pegShape
                            .strokeBorder(.gray)
                    }
                case .emojis:
                    Text(peg == Code.missingPeg ? "❓" : peg)
                        .font(.system(size: 120))
                        .minimumScaleFactor(9/120)
                }
            }
            .contentShape(pegShape)
            .aspectRatio(1, contentMode: .fit)
    }
}

func colorFromString(_ string: String) -> Color {
    switch string {
    case "blue":
        return .blue
    case "brown":
        return .brown
    case "cyan":
        return .cyan
    case "green":
        return .green
    case "indigo":
        return .indigo
    case "orange":
        return .orange
    case "purple":
        return .purple
    case "red":
        return .red
    case "yellow":
        return .yellow
    case "clear":
        return .clear
    default:
        return .clear
    }
}

#Preview {
    PegView(peg: "blue", pegType: .colors)
        .padding()
}

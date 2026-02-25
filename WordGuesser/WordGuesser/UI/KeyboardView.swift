//
//  KeyboardView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-22.
//

import SwiftUI

struct KeyboardView: View {
    // MARK: Data In
    var overlayContainerDimensions: Bool = false

    // MARK: Data Out Function
//    let onChoose: ((Letter) -> Void)?
    
    // MARK: - Body
    
//    let letterChoices: [Letter] = "QWERTYUIOPASDFGHJKLZXCVBNM".map { Letter($0) }
    let letterChoicesForRow1: [Letter] = "QWERTYUIOP".map { Letter($0) }
    let letterChoicesForRow2: [Letter] = "ASDFGHJKL".map { Letter($0) }
    let letterChoicesForRow3: [Letter] = "ZXCVBNM".map { Letter($0) }
    
    var body: some View {
        VStack(spacing: 4) {
            KeyboardRowView(letters: letterChoicesForRow1, overlayContainerDimensions: overlayContainerDimensions)
            
            KeyboardRowView(letters: letterChoicesForRow2, overlayContainerDimensions: overlayContainerDimensions)
            
            KeyboardRowView(letters: letterChoicesForRow3, overlayContainerDimensions: overlayContainerDimensions)
        }
    }
}

#Preview {
    KeyboardView(overlayContainerDimensions: false)
    KeyboardView(overlayContainerDimensions: true)
}

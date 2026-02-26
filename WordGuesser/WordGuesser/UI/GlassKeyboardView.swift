//
//  GlassKeyboardView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-26.
//

import SwiftUI

struct GlassKeyboardView: View {
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
        VStack(spacing: -2) {
            GlassKeyboardRowView(letters: letterChoicesForRow1)
            
            GlassKeyboardRowView(letters: letterChoicesForRow2)
            
            GlassKeyboardRowView(letters: letterChoicesForRow3)
        }
    }
}
    
#Preview {
    GlassKeyboardView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
}

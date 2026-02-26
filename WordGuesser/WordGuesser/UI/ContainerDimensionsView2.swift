//
//  ContainerDimensionsView2.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-25.
//

import SwiftUI

struct ContainerDimensionsView2: View {
    @State private var viewWidth: Double = 64
    @State private var viewHeight: Double = 64
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.background)
            .strokeBorder(.purple, style: .init(dash: [4, 4]))
            .overlay {
                VStack {
                    Text(viewWidth.rounded().formatted())
                    Text(viewHeight.rounded().formatted())
                }
                .flexibleSystemFont()
                .padding(4)
            }
            .onGeometryChange(for: CGSize.self ) { geometry in
                geometry.size
            } action: { newValue in
                viewWidth = newValue.width
                viewHeight = newValue.height
            }
    }
}

#Preview {
    ContainerDimensionsView2()
}

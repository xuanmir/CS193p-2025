//
//  ContainerDimensionsView.swift
//  WordGuesser
//
//  Created by Juan Diosdado on 2026-02-23.
//

import SwiftUI

struct ContainerDimensionsView: View {
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 8)
                .fill(.background)
                .strokeBorder(.purple, style: .init(dash: [4, 4]))
                .overlay {
                    VStack {
                        Text(geometry.size.width.rounded().formatted())
                        Text(geometry.size.height.rounded().formatted())
                    }
                    .flexibleSystemFont()
                    .padding(4)
                }
        }
    }
}

#Preview {
    ContainerDimensionsView()
}

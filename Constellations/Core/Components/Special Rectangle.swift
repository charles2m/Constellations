//
//  Special Rectangle.swift
//  Constellations
//c//  Created by Charles Martin Martinière on 03/04/2024.
//

import SwiftUI

struct Special_Rectangle: View {
    var body: some View {
        GeometryReader { geometry in
                VStack {
                    Rectangle()
                        .frame(width: 150, height: 50)
                        .overlay(
                            VStack {
                                Rectangle()
                                    .frame(width: 2, height: 50)
                                    .foregroundColor(.black)
                                    .offset(y: +5)
                                HStack {
                                    Rectangle()
                                        .frame(width: 150, height: 2)
                                        .foregroundColor(.black)
                                        .offset(y: -30)
                                }
                            }
                        )
                        
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}

#Preview {
    Special_Rectangle()
}

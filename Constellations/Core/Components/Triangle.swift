//
//  Triangle.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 02/04/2024.
//

import Foundation
import SwiftUI
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        path.move(to: CGPoint(x: width / 2, y: height * 0.05))
        path.addLine(to: CGPoint(x: width * 0.05, y: height * 0.95))
        path.addLine(to: CGPoint(x: width * 0.95, y: height * 0.95))
        path.closeSubpath()

        return path
    }
}

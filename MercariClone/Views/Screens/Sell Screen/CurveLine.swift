//
//  CurveLine.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/14/23.
//

import SwiftUI

struct CurveLine: View {
    var body: some View {
        QuadSample()
            .stroke(lineWidth: 3)
            .foregroundColor(.mercariPurple)
//            .frame(width: 300, height: 300)
    }
}


struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.midX + 20 , y: rect.minY))
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct CurveLine_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
            .stroke()
    }
}

//
//  WinningLine.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/5/22.
//

import SwiftUI

struct HorizontalWin: View {
    @State private var innerTrimEnd: CGFloat = 1.0
    @State var animationDuration: Double = 0.35
    let spacing: CGFloat
    let frameDimensions: CGFloat
    var body: some View {
        Horizontal()
            .trim(from: 0, to: innerTrimEnd)
            .stroke(Color.black, style: StrokeStyle(lineWidth: 8.0, lineCap: .round))
            .frame(width: frameDimensions, height: frameDimensions)
            .offset(y: spacing)
            .onAppear() {
                innerTrimEnd = 0
                animate()
            }
            .onTapGesture {
                innerTrimEnd = 0
                animate()
            }
    }
    func animate() {
        withAnimation(.linear(duration: animationDuration)) {
            innerTrimEnd = 1.0
        }
    }
}

struct WinningLine_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWin(spacing: 0, frameDimensions: 310)
    }
}

struct Horizontal: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: 0 * width, y: 0.5 * height))
        path.addLine(to: .init(x: 1.0 * width, y: 0.5 * height))
        return path
    }
}


//
//  VerticalWin.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/5/22.
//

import SwiftUI

struct VerticalWin: View {
    @State private var innerTrimEnd: CGFloat = 1.0
    @State var animationDuration: Double = 0.35
    let spacing: Int
//    let spacing: CGFloat
    var body: some View {
        Vertical()
            .trim(from: 0, to: innerTrimEnd)
            .stroke(Color.black, style: StrokeStyle(lineWidth: 8.0, lineCap: .round))
            .frame(height: 310)
            .offset(x: CGFloat(spacing))
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

struct VerticalWin_Previews: PreviewProvider {
    static var previews: some View {
        VerticalWin(spacing: 0)
    }
}

struct Vertical: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: 0.5 * width, y: 0 * height))
        path.addLine(to: .init(x: 0.5 * width, y: 1.0 * height))
        return path
    }
}


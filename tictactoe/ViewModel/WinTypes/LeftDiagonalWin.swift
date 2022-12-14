//
//  LeftDiagonalWin.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/5/22.
//

import SwiftUI

struct LeftDiagonalWin: View {
    @State private var innerTrimEnd: CGFloat = 1.0
    let color: UIColor = #colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)
    let frameDimensions: CGFloat
    var body: some View {
        LeftDiagonal()
            .trim(from: 0, to: innerTrimEnd)
            .stroke(Color.black, style: StrokeStyle(lineWidth: 8.0, lineCap: .round))
            .frame(width: frameDimensions, height: frameDimensions)
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
        withAnimation(.linear(duration: 0.35)) {
            innerTrimEnd = 1.0
        }
    }

}


struct LeftDiagonalWin_Previews: PreviewProvider {
    static var previews: some View {
        LeftDiagonalWin(frameDimensions: 310)
    }
}

struct LeftDiagonal: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
 
        var path = Path()
        path.move(to: .init(x: 0 * width, y: 0 * height))
        path.addLine(to: .init(x: 1.0 * width, y: 1.0 * height))
        return path
    }
}

//
//  AnimatedXmarkView.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/3/22.
//

import SwiftUI

struct AnimatedXmarkView: View {
    @State private var innerTrimEnd: CGFloat = 1.0
    var animationDuration: Double = 0.35
    @Binding var sound: Bool
    var body: some View {
//        VStack {
            Xmark()
                .trim(from: 0, to: innerTrimEnd)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
                .frame(width: 40, height: 40)
//        }
        .onAppear() {
            innerTrimEnd = 0
            animate()
        }
    }
    func animate() {
        withAnimation(.linear(duration: animationDuration)) {
            innerTrimEnd = 1.0
        }
        if sound {
            SoundManager.instance.playSound(sound: .pop)
        }
    }
}

//struct AnimatedXmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimatedXmarkView()
//    }
//}

struct Xmark: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
 
        var path = Path()
        path.move(to: .init(x: 0 * width, y: 0 * height))
        path.addLine(to: .init(x: 1.0 * width, y: 1.0 * height))
        path.move(to: .init(x: 1.0 * width, y: 0 * height))
        path.addLine(to: .init(x: 0 * width, y: 1.0 * height))
        return path
    }
}

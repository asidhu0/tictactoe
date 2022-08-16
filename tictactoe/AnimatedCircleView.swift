//
//  AnimatedCheckmarkView.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/3/22.
//

import SwiftUI

struct AnimatedCircleView: View {
    var animationDuration: Double = 0.35
    var width: CGFloat = 50
    var height: CGFloat = 50
    var lineWidth: CGFloat = 5
    @State private var outerTrimEnd: CGFloat = 0
    @Binding var sound: Bool
    let color: Color
    var body: some View {
//            ZStack {
                Circle()
                    .trim(from: 0, to: outerTrimEnd)
//                    .stroke(Color.black, lineWidth: 3)
//                    .stroke(color, lineWidth: 5)
                    .stroke(color, lineWidth: lineWidth)
//                    .stroke(Color.blue, lineWidth: lineWidth)
                    .rotationEffect(.degrees(-90))
//            }
//            .frame(width: 50, height: 50)
            .frame(width: width, height: height)
            .onAppear() {
                animate()
            }
    }
    func animate() {
        withAnimation(.linear(duration: animationDuration)) {
            outerTrimEnd = 1.0
        }
        if sound {
            SoundManager.instance.playSound(sound: .circle)
        }
    }
}

struct AnimatedCheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCircleView(sound: .constant(false), color: .orange)
    }
}

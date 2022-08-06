//
//  AnimatedCheckmarkView.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/3/22.
//

import SwiftUI

struct AnimatedCircleView: View {
    var animationDuration: Double = 0.35
    @State private var outerTrimEnd: CGFloat = 0
    @Binding var sound: Bool
    var body: some View {
//            ZStack {
                Circle()
                    .trim(from: 0, to: outerTrimEnd)
                    .stroke(Color.black, lineWidth: 3)
                    .rotationEffect(.degrees(-90))
//            }
            .frame(width: 40, height: 40)
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

//struct AnimatedCheckmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimatedCircleView()
//    }
//}

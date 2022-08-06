//
//  AnimatedCheckmarkView.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/3/22.
//

import SwiftUI

struct SwiftUIView: View {
    var animationDuration: Double = 0.35
    @State private var outerTrimEnd: CGFloat = 0
    var body: some View {
            ZStack {
                Circle()
                    .trim(from: 0, to: outerTrimEnd)
                    .stroke(Color.black, lineWidth: 3)
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: 40, height: 40)
            .onAppear() {
                animate()
            }
    }
    func animate() {
        withAnimation(.linear(duration: animationDuration)) {
            outerTrimEnd = 1.0
        }
        SoundManager.instance.playSound(sound: .pop)
    }
}

struct AnimatedCheckmarkView_Previews1: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}


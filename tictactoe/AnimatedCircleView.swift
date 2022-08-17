////
////  AnimatedCheckmarkView.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 8/3/22.
////
//
//import SwiftUI
//
//struct AnimatedCircleView: View {
//    var animationDuration: Double = 0.35
//    var width: CGFloat = 50
//    var height: CGFloat = 50
//    var lineWidth: CGFloat = 5
//    @State private var outerTrimEnd: CGFloat = 0
//    @Binding var sound: Bool
//    let color: Color
//    var body: some View {
//        Circle()
//            .trim(from: 0, to: outerTrimEnd)
//            .stroke(color, lineWidth: lineWidth)
//            .rotationEffect(.degrees(-90))
//            .frame(width: width, height: height)
//            .onAppear() {
//                animate()
//            }
//    }
//    func animate() {
//        withAnimation(.linear(duration: animationDuration)) {
//            outerTrimEnd = 1.0
//        }
//        if sound {
//            SoundManager.instance.playSound(sound: .circle)
//        }
//    }
//}
//
//struct AnimatedCheckmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimatedCircleView(sound: .constant(false), color: .orange)
//    }
//}

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
    let color: Color
    var body: some View {
        Circle()
            .trim(from: 0, to: outerTrimEnd)
            .stroke(color, lineWidth: lineWidth)
            .rotationEffect(.degrees(-90))
            .frame(width: width, height: height)
            .onAppear() {
                animate()
            }
    }
    func animate() {
        withAnimation(.linear(duration: animationDuration)) {
            outerTrimEnd = 1.0
        }
    }
}

struct AnimatedCheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCircleView(color: .orange)
    }
}

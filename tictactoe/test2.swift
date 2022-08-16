//
//  test2.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/7/22.
//

import SwiftUI

struct test2: View {
    @State private var appearance: Float = 4
    let appearanceText = [
        "Easy",
        "Medium",
        "Hard",
        "Impossible"
    ]
    @State var showingPopup = false
    @State private var showModal: Bool = false
    @State var offset: CGFloat = 0
    var body: some View {
        
        
        // Custom Slider
        VStack {
            Text(returnDiffLevel())
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule()
                    .fill(Color.black.opacity(0.25))
                    .frame(height: 30)
                
                Capsule()
                    .fill(Color.orange)
                    .frame(width: offset + 20, height: 33)
                
                // DOTS
                HStack(spacing: (UIScreen.main.bounds.width - 100) / 17) {
                    ForEach(0..<17, id: \.self) {index in
                        Circle()
                            .fill(Color.white)
                            .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                    }
                }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 35, height: 35)
                    .background(
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .offset(x: offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                            offset = value.location.x - 20
                        }
                    }))
            }
            .padding()
            .padding(.top, 33)
        }
    }
    func returnDiffLevel() -> String {
        let percent = offset / UIScreen.main.bounds.width - 70
        if percent >= -70 && percent <= -69.81 {
            return "Easy"
        }
        else if percent > -69.81 && percent <= -69.59 {
            return "Medium"
        }
        else if percent > -69.59 && percent <= -69.37 {
            return "Hard"
        }
        return "Impossible"
    }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}

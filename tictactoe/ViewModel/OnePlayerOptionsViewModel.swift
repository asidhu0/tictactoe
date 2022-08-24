//
//  OnePlayerOptionsViewModel.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/21/22.
//

import SwiftUI

final class OnePlayerOptionsViewModel: ObservableObject {
    @Published var textFieldText: String = ""
    @Published var pieceType: String = "xmark"  // Deafult peice is xmark if user does not pick
    @Published var modeOfDifficulty: String = ""
    @Published var clickedX: Bool = true
    @Published var isShowingColorPopup: Bool = false
    @Published var color0: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @Published var colorX: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @Published var offset: CGFloat = 0
    @State var currentDragOffset: CGFloat = 0
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
    
    func processSliderDrag(value: DragGesture.Value ) {
        if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
            offset = value.location.x - 20
        }
    }
    
    func animatePopUp() {
        withAnimation(.easeInOut) {
            isShowingColorPopup = false
        }
    }
    
    func processXmarkClick() {
        clickedX = true
        withAnimation(.easeInOut) {
            isShowingColorPopup = true
        }
        pieceType = "xmark"
    }
    
    func processCircleClick() {
        clickedX = false
        withAnimation(.easeInOut) {
            isShowingColorPopup = true
        }
        pieceType = "circle"
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

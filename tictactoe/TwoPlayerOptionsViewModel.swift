//
//  TwoPlayerOptionsViewModel.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/21/22.
//

import SwiftUI

final class TwoPlayerOptionsViewModel: ObservableObject {
    @Published var textFieldText1: String = ""
    @Published var textFieldText2: String = ""
    @Published var pickedX: Bool = true
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
    @Published var color0: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @Published var colorX: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @Published var isShowingColorPopup: Bool = false
    
    func processXmarkClick2() {
        pickedX = true
        withAnimation(.easeInOut) {
            isShowingColorPopup = true
        }
    }
    
    func processCircleClick2() {
        pickedX = false
        withAnimation(.easeInOut) {
            isShowingColorPopup = true
        }
    }
    
    func animatePopUp2() {
        withAnimation(.easeInOut) {
            isShowingColorPopup = false
        }
    }
}

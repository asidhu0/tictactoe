//
//  MainMenuViewModel.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/20/22.
//

import SwiftUI

final class MainMenuViewModel: ObservableObject {
    @Published var score: scores = scores(playerScoreEasy: 0, playerScoreMedium: 0, playerScoreHard: 0, playerScoreImpossible: 0, computerScoreEasy: 0, computerScoreMedium: 0, computerScoreHard: 0, computerScoreImpossible: 0, twoPlayer1: 0, twoPlayer2: 0)
    @Published var sound: Bool = true
    @Published var numPlayers: Int = 0
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
}

//
//  AllModesDiff.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/2/22.
//

import SwiftUI
import Foundation
import AVFoundation

struct GameBoard: View {
    let layout: [GridItem]  = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var isGameBoardDisabled = false
    @State private var alertItem: AlertItem?
    @State var moves: [Move?] = Array(repeating: nil , count: 9)
    @State private var twoPlayerTurnDecider: Bool = true
    @State var line: Int = 0
    @State private var leftdwin: Bool = false
    @State private var rightdwin: Bool = false
    @State private var horizwin: Bool = false
    @State private var vertwin: Bool = false
    @State private var draw: Bool = false
    @State private var computerWin: Bool = false
    @State private var userMovewin: Bool = false

    @Binding var score: scores
    @Binding var sound: Bool
    
    let modeOfDifficulty: String  // init()
    
    var body: some View {
        GeometryReader  { geometry in
            VStack {
                Spacer()
                ZStack {
                    LazyVGrid(columns: layout, spacing: 10) {
                        ForEach(0..<9)  { i in
                            
                            ZStack  {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.blue)
                                    .frame(width: geometry.size.width/3 - 15,
                                           height: geometry.size.width/3 - 15)
                                if (moves[i] != nil) {
                                    if moves[i]?.indicator == "xmark" {
                                        AnimatedXmarkView(sound: $sound)
                                    }
                                    else if moves[i]?.indicator == "circle" {
                                        AnimatedCircleView(sound: $sound)
                                    }
                                }
                            }
                            .onTapGesture {
                                
                                // TWO PLAYER MODE
                                if modeOfDifficulty == "twoplayer" {
                                    if twoPlayerMode(index: i, turnDecider: &twoPlayerTurnDecider) {
                                        twoPlayerTurnDecider.toggle()
                                    }
                                    if twoPlayerModeGameEndChecker(turnDecider: &twoPlayerTurnDecider) {
                                        if draw {
                                            return
                                        }
                                        else if line == 0 || line == 1 || line == 2 {
                                            horizwin = true
                                        }
                                        else if line == 3 || line == 4 || line == 5 {
                                            vertwin = true
                                        }
                                        else if line == 6 {
                                            leftdwin = true
                                        }
                                        else if line == 7 {
                                            rightdwin = true
                                        }
                                        return
                                    }
                                }
                                
                                // ONE PLAYER MODE
                                
                                else {
                                    if userMove(index: i) {
                                        return
                                    }
                                    
                                    if userMoveWinChecker() {
                                        if draw {
                                            return
                                        }
                                        if line == 0 || line == 1 || line == 2 {
                                            horizwin = true
                                        }
                                        else if line == 3 || line == 4 || line == 5 {
                                            vertwin = true
                                        }
                                        else if line == 6 {
                                            leftdwin = true
                                        }
                                        else if line == 7 {
                                            rightdwin = true
                                        }
                                        return
                                    }
                                    // computer's move
                                    computerMove()
                                }
                            }
                        }
                    }
                    
                    /// END OF LAZY V GRID
                    
                    if leftdwin {
                        LeftDiagonalWin()
                    }
                    else if rightdwin {
                        RightDiagonalWin()
                    }
                    else if horizwin {
                        if line == 0 {
                            HorizontalWin(spacing: -120)
                        }
                        else if line == 1 {
                            HorizontalWin(spacing: 0)
                        }
                        else if line == 2 {
                            HorizontalWin(spacing: 120)
                        }
                    }
                    else if vertwin {
                        if line == 3 {
                            VerticalWin(spacing: -120)
                        }
                        else if line == 4 {
                            VerticalWin(spacing: 0)
                        }
                        else if line == 5 {
                            VerticalWin(spacing: 120)
                        }
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        if modeOfDifficulty == "easy" {
                            Text("\(score.playerScoreEasy)")
                        }
                        else if modeOfDifficulty == "medium" {
                            Text("\(score.playerScoreMedium)")
                        }
                        else if modeOfDifficulty == "hard" {
                            Text("\(score.playerScoreHard)")
                        }
                        else if modeOfDifficulty == "impossible" {
                            Text("\(score.playerScoreImpossible)")
                        }
                        else if modeOfDifficulty == "twoplayer" {
                            Text("\(score.twoPlayer1)")
                        }
                        Text("Player")
                    }
                    Spacer()
                    VStack {
                        if modeOfDifficulty == "easy" {
                            Text("\(score.computerScoreEasy)")
                        }
                        else if modeOfDifficulty == "medium" {
                            Text("\(score.computerScoreMedium)")
                        }
                        else if modeOfDifficulty == "hard" {
                            Text("\(score.computerScoreHard)")
                        }
                        else if modeOfDifficulty == "impossible" {
                            Text("\(score.computerScoreImpossible)")
                        }
                        else if modeOfDifficulty == "twoplayer" {
                            Text("\(score.twoPlayer2)")
                        }
                        Text("Computer")
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Button("Reset Score") {
                        resetScore()
                    }
                    Spacer()
                    Button("Reset Game") {
                        resetGame(moves: &moves)
                    }
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
            .padding()
            .alert(item: $alertItem, content: {alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action:
                    {
                    resetGame(moves: &moves)
                    if sound {
                        MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "background")
                    }
                    if leftdwin { leftdwin = false }
                    if rightdwin { rightdwin = false }
                    if horizwin { horizwin = false }
                    if vertwin { vertwin = false }
                    if draw { draw = false }
                }))
            })
        }
    }
    
    func resetGame(moves: inout [Move?]) {  // FIXME
        moves = Array(repeating: nil, count: 9)
        
    }
    
    func resetScore() {
        if modeOfDifficulty == "easy" {
            score.playerScoreEasy = 0
            score.computerScoreEasy = 0
        }
        else if modeOfDifficulty == "medium" {
            score.playerScoreMedium = 0
            score.computerScoreMedium = 0
        }
        else if modeOfDifficulty == "hard" {
            score.playerScoreHard = 0
            score.computerScoreHard = 0
        }
        else if modeOfDifficulty == "impossible" {
            score.playerScoreImpossible = 0
            score.computerScoreImpossible = 0
        }
        else if modeOfDifficulty == "twoplayer" {
            score.twoPlayer1 = 0
            score.twoPlayer2 = 0
        }
    }
    
    func userMove(index: Int) -> Bool {
        if (moves[index] != nil) {
            return true
        }
        else {
        moves[index] = Move(player: .human, boardIndex: index)
            if userMoveWinChecker() {
                isGameBoardDisabled = false
            }
            else {
                isGameBoardDisabled = true
            }
        }
        return false
    }
    
    func userMoveWinChecker() -> Bool {
        if checkForWin(move: moves, piece: "xmark", line: &line) {
            userMovewin = true

            alertItem = AlertContext.humanWin

            if modeOfDifficulty == "easy" {
                score.playerScoreEasy += 0.5
            }
            else if modeOfDifficulty == "medium" {
                score.playerScoreMedium += 0.5
            }
            else if modeOfDifficulty == "hard" {
                score.playerScoreHard += 0.5
            }
            else if modeOfDifficulty == "impossible" {
                score.playerScoreImpossible += 0.5
            }
            if sound {
                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
            }
            return true
        }
        else if checkForDraw(move: moves) {
            draw = true
            alertItem = AlertContext.draw
            if sound {
                MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
            }
            return true
        }
        return false
    }
    
    func computerMove()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if modeOfDifficulty == "easy" {
                easyComputerMove(move: &moves)
            }
            else if modeOfDifficulty == "medium" {
                mediumComputerMove(move: &moves)
            }
            else if modeOfDifficulty == "hard" {
                hardComputerMove(move: &moves)
            }
            else if modeOfDifficulty == "impossible" {
                impossibleComputerMove(move: &moves)
            }
            
            // check for computer win
            if checkForWin(move: moves, piece: "circle", line: &line) {
                computerWin = true
                if computerWin {
                    if draw {
                    }
                    else if line == 0 || line == 1 || line == 2 {
                        horizwin = true
                    }
                    else if line == 3 || line == 4 || line == 5 {
                        vertwin = true
                    }
                    else if line == 6 {
                        leftdwin = true
                    }
                    else if line == 7 {
                        rightdwin = true
                    }
                }
                alertItem = AlertContext.computerWin
                if modeOfDifficulty == "easy" {
                    score.computerScoreEasy += 1
                }
                else if modeOfDifficulty == "medium" {
                    score.computerScoreMedium += 1
                }
                else if modeOfDifficulty == "hard" {
                    score.computerScoreHard += 1
                }
                else if modeOfDifficulty == "impossible" {
                    score.computerScoreImpossible += 1
                }
                isGameBoardDisabled = false
                if sound {
                    MusicPlayer.shared.playSoundEffect(soundEffect: "lose")
                }
                return
            }
            else if checkForDraw(move: moves) {
                alertItem = AlertContext.draw
                if sound {
                    MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
                }
                return
            }
            isGameBoardDisabled = false
        }
    }
    
    func twoPlayerMode(index: Int, turnDecider: inout Bool) -> Bool {
        if (moves[index] != nil) {
            return false
        }
        moves[index] = Move(player: turnDecider ? .human : .computer, boardIndex: index)
        return true
    }
    
    func twoPlayerModeGameEndChecker(turnDecider: inout Bool) -> Bool {
        if checkForWin(move: moves, piece: "xmark", line: &line) {
            alertItem = AlertContext.player1win
            score.twoPlayer1 += 1
            turnDecider = true
            if sound {
                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
            }
            return true
        }
        else if checkForWin(move: moves, piece: "circle", line: &line) {
            score.twoPlayer2 += 1
            alertItem = AlertContext.player2win
            turnDecider = true
            if sound {
                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
            }
            return true
        }
        else if checkForDraw(move: moves) {
            alertItem = AlertContext.draw
            turnDecider = true
            draw = true
            if sound {
                MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
            }
            return true
        }
        return false
    }
    
}
//
//struct AllModesDiff_Previews: PreviewProvider {
//    static var previews: some View {
//        GameBoard(score: <#Binding<scores>#>, sound: <#Binding<Bool>#>, modeOfDifficulty: <#String#>)
//    }
//}


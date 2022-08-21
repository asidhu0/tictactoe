////
////  GameScreenViewModel.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 8/20/22.
////
//
//import SwiftUI
//
//final class GameScreenViewModel: ObservableObject {
//
//    let layout: [GridItem]  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    @Published var isGameBoardDisabled = false
//    @Published var alertItem: AlertItem?
//    @Published var moves: [Move?] = Array(repeating: nil , count: 9)
//    @Published var line: Int = 0
//    @Published var leftdwin: Bool = false
//    @Published var rightdwin: Bool = false
//    @Published var horizwin: Bool = false
//    @Published var vertwin: Bool = false
//    @Published var draw: Bool = false
//    @Published var computerWin: Bool = false
//    @Published var userMovewin: Bool = false
//    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
//    var modeOfDifficulty: String
//    var onePlayerPieceDecider: Bool
//    var player1Name: String
//    var player2Name: String  // THIS IS WHATEVER PIECE PLAYER 1 PICKED
//    var color0: Color
//    var colorX: Color
////    let modeOfDifficulty: String
////    let onePlayerPieceDecider: Bool
////    let player1Name: String
////    let player2Name: String  // THIS IS WHATEVER PIECE PLAYER 1 PICKED
////    let color0: Color
////    let colorX: Color
//
//    func resetGame(moves: inout [Move?]) {
//        moves = Array(repeating: nil, count: 9)
//        twoPlayerTurnDeciderForResetFunc = twoPlayerTurnDecider
//    }
//
//    func resetScore() {
//        if modeOfDifficulty == "Easy" {
//            score.playerScoreEasy = 0
//            score.computerScoreEasy = 0
//        }
//        else if modeOfDifficulty == "Medium" {
//            score.playerScoreMedium = 0
//            score.computerScoreMedium = 0
//        }
//        else if modeOfDifficulty == "Hard" {
//            score.playerScoreHard = 0
//            score.computerScoreHard = 0
//        }
//        else if modeOfDifficulty == "Impossible" {
//            score.playerScoreImpossible = 0
//            score.computerScoreImpossible = 0
//        }
//        else if modeOfDifficulty == "twoplayer" {
//            score.twoPlayer1 = 0
//            score.twoPlayer2 = 0
//        }
//    }
//
//    func userMove(index: Int) -> Bool {
//        if (moves[index] != nil) {
//            return true
//        }
//        else {  // turnDecider ? .human : .computer
//            moves[index] = Move(player: onePlayerPieceDecider ? .human : .computer, boardIndex: index)
//            if userMoveWinChecker() {
//                isGameBoardDisabled = false
//            }
//            else {
//                isGameBoardDisabled = true
//            }
//        }
//        return false
//    }
//
//    func userMoveWinChecker() -> Bool {
//        if checkForWin(move: moves, piece: "xmark", line: &line) {  // CHANGED: || checkForWin(move: moves, piece: "circle", line: &line)
//            userMovewin = true
//
//            alertItem = AlertContext.humanWin
//
//            if modeOfDifficulty == "Easy" {
//                score.playerScoreEasy += 0.5
//            }
//            else if modeOfDifficulty == "Medium" {
//                score.playerScoreMedium += 0.5
//            }
//            else if modeOfDifficulty == "Hard" {
//                score.playerScoreHard += 0.5
//            }
//            else if modeOfDifficulty == "Impossible" {
//                score.playerScoreImpossible += 0.5
//            }
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        if checkForWin(move: moves, piece: "circle", line: &line) {
//            userMovewin = true
//
//            alertItem = AlertContext.humanWin
//
//            if modeOfDifficulty == "Easy" {
//                score.computerScoreEasy += 0.5
//            }
//            else if modeOfDifficulty == "Medium" {
//                score.computerScoreMedium += 0.5
//            }
//            else if modeOfDifficulty == "Hard" {
//                score.computerScoreHard += 0.5
//            }
//            else if modeOfDifficulty == "Impossible" {
//                score.computerScoreImpossible += 0.5
//            }
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        else if checkForDraw(move: moves) {
//            draw = true
//            alertItem = AlertContext.draw
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
//            }
//            return true
//        }
//        return false
//    }
//
//    func computerMove(computerPiece: String)  {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            if modeOfDifficulty == "Easy" {
//                easyComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "Medium" {
//                mediumComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "Hard" {
//                hardComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "Impossible" {
//                impossibleComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//
//            // check for computer win
//            if checkForWin(move: moves, piece: "circle", line: &line) { // CHANGED: || checkForWin(move: moves, piece: "xmark", line: &line)
//                computerWin = true
//                if computerWin {
//                    if draw {
//                    }
//                    else if line == 0 || line == 1 || line == 2 {
//                        horizwin = true
//                    }
//                    else if line == 3 || line == 4 || line == 5 {
//                        vertwin = true
//                    }
//                    else if line == 6 {
//                        leftdwin = true
//                    }
//                    else if line == 7 {
//                        rightdwin = true
//                    }
//                }
//                alertItem = AlertContext.computerWin
//                if modeOfDifficulty == "Easy" {
//                    score.computerScoreEasy += 1
//                }
//                else if modeOfDifficulty == "Medium" {
//                    score.computerScoreMedium += 1
//                }
//                else if modeOfDifficulty == "Hard" {
//                    score.computerScoreHard += 1
//                }
//                else if modeOfDifficulty == "Impossible" {
//                    score.computerScoreImpossible += 1
//                }
//                isGameBoardDisabled = false
//                if sound {
//                    MusicPlayer.shared.playSoundEffect(soundEffect: "lose")
//                }
//                return
//            }
//            if checkForWin(move: moves, piece: "xmark", line: &line) { // CHANGED: || checkForWin(move: moves, piece: "circle", line: &line)
//                computerWin = true
//                if computerWin {
//                    if draw {
//                    }
//                    else if line == 0 || line == 1 || line == 2 {
//                        horizwin = true
//                    }
//                    else if line == 3 || line == 4 || line == 5 {
//                        vertwin = true
//                    }
//                    else if line == 6 {
//                        leftdwin = true
//                    }
//                    else if line == 7 {
//                        rightdwin = true
//                    }
//                }
//                alertItem = AlertContext.computerWin
//                if modeOfDifficulty == "Easy" {
//                    score.playerScoreEasy += 1
//                }
//                else if modeOfDifficulty == "Medium" {
//                    score.playerScoreMedium += 1
//                }
//                else if modeOfDifficulty == "Hard" {
//                    score.playerScoreHard += 1
//                }
//                else if modeOfDifficulty == "Impossible" {
//                    score.playerScoreImpossible += 1
//                }
//                isGameBoardDisabled = false
//                if sound {
//                    MusicPlayer.shared.playSoundEffect(soundEffect: "lose")
//                }
//                return
//            }
//            else if checkForDraw(move: moves) {
//                alertItem = AlertContext.draw
//                if sound {
//                    MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
//                }
//                return
//            }
//            isGameBoardDisabled = false
//        }
//    }
//
//    func twoPlayerMode(index: Int, turnDecider: inout Bool) -> Bool {
//        if (moves[index] != nil) {
//            return false
//        }
//        moves[index] = Move(player: turnDecider ? .human : .computer, boardIndex: index)
//        return true
//    }
//
//    func twoPlayerModeGameEndChecker(turnDecider: inout Bool) -> Bool {
//        if checkForWin(move: moves, piece: "xmark", line: &line) {
//            alertItem = AlertContext.player1win
//            score.twoPlayer1 += 1
//            turnDecider = true
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        else if checkForWin(move: moves, piece: "circle", line: &line) {
//            score.twoPlayer2 += 1
//            alertItem = AlertContext.player2win
//            turnDecider = true
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        else if checkForDraw(move: moves) {
//            alertItem = AlertContext.draw
//            turnDecider = true
//            draw = true
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "tie")
//            }
//            return true
//        }
//        return false
//    }
//
//}

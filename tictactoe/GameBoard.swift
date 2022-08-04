//
//  AllModesDiff.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/2/22.
//

import SwiftUI

struct GameBoard: View {
    let layout: [GridItem]  = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var isGameBoardDisabled = false
    @State private var alertItem: AlertItem?
    @State private var playerScore: Int = 0
    @State private var computerScore: Int = 0
    @State var moves: [Move?] = Array(repeating: nil , count: 9)
    @State private var isAnimating: Bool = false

    @Binding var score: scores
    
    let modeOfDifficulty: String  // init()
    
    var body: some View {
        GeometryReader  { geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(0..<9)  { i in
                        
                        ZStack  {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                                .frame(width: geometry.size.width/3 - 15,
                                       height: geometry.size.width/3 - 15)
                            if (moves[i] != nil) {
                                if moves[i]?.indicator == "xmark" {
                                    AnimatedXmarkView()
                                }
                                else if moves[i]?.indicator == "circle" {
                                    AnimatedCircleView()
                                }

                             }
                        }
                        .onTapGesture {
                            isAnimating.toggle()
                            // user's move
                            if (moves[i] != nil) {
                                return
                            }
                            else {
                            moves[i] = Move(player: .human, boardIndex: i)
                                
                                // check for human win
                                if checkForWinHuman(move: moves) {
                                    // draw winning line
                                    alertItem = AlertContext.humanWin
                                    
                                    if modeOfDifficulty == "easy" {
                                        score.playerScoreEasy += 1
                                    }
                                    else if modeOfDifficulty == "medium" {
                                        score.playerScoreMedium += 1
                                    }
                                    else if modeOfDifficulty == "hard" {
                                        score.playerScoreHard += 1
                                    }
                                    return
                                }
                                else if checkForDraw(move: moves){
                                    alertItem = AlertContext.draw
                                    return
                                }
                                isGameBoardDisabled = true
                            }
                            
                            // computer's move
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
                                
                                // check for computer win
                                if checkForWinComputer(move: moves) {
                                    // draw winning line
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
                                    isGameBoardDisabled = false
                                    return
                                }
                                else if checkForDraw(move: moves) {
                                    alertItem = AlertContext.draw
                                    return
                                }
                                isGameBoardDisabled = false
                            }
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
                        Text("Computer")
                    }
                    Spacer()
                }
                Spacer()
                Button("Reset Score") {
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
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
            .padding()
            .alert(item: $alertItem, content: {alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {resetGame(moves: &moves)}))
            })
        }
    }
}

//struct AllModesDiff_Previews: PreviewProvider {
//    static var previews: some View {
//        GameBoard(modeOfDifficulty: "easy")
//    }
//}

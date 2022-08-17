//
//  colorTest.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/16/22.
//

import SwiftUI

struct colorTest: View {
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var score: scores = scores(playerScoreEasy: 0, playerScoreMedium: 0, playerScoreHard: 0, playerScoreImpossible: 0, computerScoreEasy: 0, computerScoreMedium: 0, computerScoreHard: 0, computerScoreImpossible: 0, twoPlayer1: 0, twoPlayer2: 0)
    @State private var isGameBoardDisabled = false
    @State private var alertItem: AlertItem?
    @State var moves: [Move?] = Array(repeating: nil , count: 9)
    @State private var count: Int = 0
    @State var line: Int = 0
    @State private var leftdwin: Bool = false
    @State private var rightdwin: Bool = false
    @State private var horizwin: Bool = false
    @State private var vertwin: Bool = false
    @State private var draw: Bool = false
    @State private var computerWin: Bool = false
    @State private var userMovewin: Bool = false
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
    
    // init()
    let modeOfDifficulty: String
    let onePlayerPieceDecider: Bool
    let player1Name: String
//    let pieceType: String
    let player2Name: String  // THIS IS WHATEVER PIECE PLAYER 1 PICKED
    let color0: Color
    let colorX: Color
    
    @State var twoPlayerTurnDecider: Bool
    @State var twoPlayerTurnDeciderForResetFunc: Bool
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea(.all)
            GeometryReader  { geometry in
                VStack {
                    Spacer()
                    ZStack {
                        LazyVGrid(columns: layout, spacing: 10) {
                            ForEach(0..<9)  { i in
                                
                                ZStack  {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                                        .frame(width: geometry.size.width/3 - 15,
                                               height: geometry.size.width/3 - 15)
                                        .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                                    if (moves[i] != nil) {
                                        if moves[i]?.indicator == "xmark" {
                                            AnimatedXmarkView(color: colorX)
                                        }
                                        else if moves[i]?.indicator == "circle" {
                                            AnimatedCircleView(color: color0)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    
                                    // TWO PLAYER MODE
                                    if modeOfDifficulty == "twoplayer" {
                                        if twoPlayerMode(index: i, turnDecider: &twoPlayerTurnDeciderForResetFunc) {
                                            twoPlayerTurnDeciderForResetFunc.toggle()
                                        }
                                        if twoPlayerModeGameEndChecker(turnDecider: &twoPlayerTurnDeciderForResetFunc) {
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
                                        computerMove(computerPiece: player2Name == "xmark" ? "circle" : "xmark")
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
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .foregroundColor(colorX)
                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                            HStack {
                                if modeOfDifficulty == "twoplayer" {
                                    if player1Name == "" {
                                        Text("Player 1 :")
                                    }
                                    else {
                                        Text(player1Name + " :")
                                            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                            .foregroundColor(.black.opacity(0.7))
                                    }
                                }
                                else {
                                    if player2Name == "xmark" {
                                        Text(player1Name + ":")
                                    }
                                    else {
                                        Text("Computer :")
                                    }
                                }
                                if modeOfDifficulty == "Easy" {
                                    Text("\(Int(score.playerScoreEasy))")
                                }
                                else if modeOfDifficulty == "Medium" {
                                    Text("\(Int(score.playerScoreMedium))")
                                }
                                else if modeOfDifficulty == "Hard" {
                                    Text("\(Int(score.playerScoreHard))")
                                }
                                else if modeOfDifficulty == "Impossible" {
                                    Text("\(Int(score.playerScoreImpossible))")
                                }
                                else if modeOfDifficulty == "twoplayer" {
                                    Text("\(Int(score.twoPlayer1))")
                                        .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                        .foregroundColor(.black.opacity(0.7))
                                }
                            }
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .foregroundColor(color0)
                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                            HStack {
                                if modeOfDifficulty == "twoplayer" {
                                    if player2Name == "" {
                                        Text("Player 2 :")
                                    }
                                    else {
                                        Text(player2Name + " :")
                                            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                            .foregroundColor(.black.opacity(0.7))
                                    }
                                }
                                else {
                                    if player2Name == "circle" {
                                        Text(player1Name + " :")
                                    }
                                    else {
                                        Text("Computer :")
                                    }
                                }
                                if modeOfDifficulty == "Easy" {
                                    Text("\(Int(score.computerScoreEasy))")
                                }
                                else if modeOfDifficulty == "Medium" {
                                    Text("\(Int(score.computerScoreMedium))")
                                }
                                else if modeOfDifficulty == "Hard" {
                                    Text("\(Int(score.computerScoreHard))")
                                }
                                else if modeOfDifficulty == "Impossible" {
                                    Text("\(Int(score.computerScoreImpossible))")
                                }
                                else if modeOfDifficulty == "twoplayer" {
                                    Text("\(Int(score.twoPlayer2))")
                                        .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                        .foregroundColor(.black.opacity(0.7))
                                }
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Button {
                            resetScore()
                        } label: {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 15)
//                                    .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
//                                    .frame(width: 155, height: 45)
//                                Text("Reset Score")
//                                    .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
//                                    .foregroundColor(.cyan)
//                            }
                            
//                            Text("Reset Score")
//                                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
//                                .foregroundColor(.cyan)
                            
                            // PURPLE COLOR
                            Text("Reset Score")
                                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                        }
                        Spacer()
                        Button {
                            resetGame(moves: &moves)
                        } label: {
                            
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 15)
//                                    .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
//                                    .frame(width: 155, height: 45)
                            
//                                Text("Reset Game")
//                                    .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
//                                    .foregroundColor(.cyan)
//                            }
                            
//                            Text("Reset Game")
//                                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
//                                .foregroundColor(.cyan)
                            
                            // PURPLE COLOR
                            Text("Reset Game")
                                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
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
                        if leftdwin { leftdwin = false }
                        if rightdwin { rightdwin = false }
                        if horizwin { horizwin = false }
                        if vertwin { vertwin = false }
                        if draw { draw = false }
                    }))
                })
            }
        }
    }
    
    
    ////////////////////////////////////////////////////////////////      FUNCTIONS //////////////////////////////// ////////////////////////////////
    
    func resetGame(moves: inout [Move?]) {
        moves = Array(repeating: nil, count: 9)
        twoPlayerTurnDeciderForResetFunc = twoPlayerTurnDecider
    }
    
    func resetScore() {
        if modeOfDifficulty == "Easy" {
            score.playerScoreEasy = 0
            score.computerScoreEasy = 0
        }
        else if modeOfDifficulty == "Medium" {
            score.playerScoreMedium = 0
            score.computerScoreMedium = 0
        }
        else if modeOfDifficulty == "Hard" {
            score.playerScoreHard = 0
            score.computerScoreHard = 0
        }
        else if modeOfDifficulty == "Impossible" {
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
        else {  // turnDecider ? .human : .computer
            moves[index] = Move(player: onePlayerPieceDecider ? .human : .computer, boardIndex: index)
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
        if checkForWin(move: moves, piece: "xmark", line: &line) {  // CHANGED: || checkForWin(move: moves, piece: "circle", line: &line)
            userMovewin = true

            alertItem = AlertContext.humanWin

            if modeOfDifficulty == "Easy" {
                score.playerScoreEasy += 0.5
            }
            else if modeOfDifficulty == "Medium" {
                score.playerScoreMedium += 0.5
            }
            else if modeOfDifficulty == "Hard" {
                score.playerScoreHard += 0.5
            }
            else if modeOfDifficulty == "Impossible" {
                score.playerScoreImpossible += 0.5
            }
            return true
        }
        if checkForWin(move: moves, piece: "circle", line: &line) {  // CHANGED: checkForWin(move: moves, piece: "xmark", line: &line) ||
            userMovewin = true

            alertItem = AlertContext.humanWin

            if modeOfDifficulty == "Easy" {
                score.computerScoreEasy += 0.5
            }
            else if modeOfDifficulty == "Medium" {
                score.computerScoreMedium += 0.5
            }
            else if modeOfDifficulty == "Hard" {
                score.computerScoreHard += 0.5
            }
            else if modeOfDifficulty == "Impossible" {
                score.computerScoreImpossible += 0.5
            }
            return true
        }
        else if checkForDraw(move: moves) {
            draw = true
            alertItem = AlertContext.draw
            return true
        }
        return false
    }
    
    func computerMove(computerPiece: String)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if modeOfDifficulty == "Easy" {
                easyComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
            }
            else if modeOfDifficulty == "Medium" {
                mediumComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
            }
            else if modeOfDifficulty == "Hard" {
                hardComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
            }
            else if modeOfDifficulty == "Impossible" {
                impossibleComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
            }
            
            // check for computer win
            if checkForWin(move: moves, piece: "circle", line: &line) { // CHANGED: || checkForWin(move: moves, piece: "xmark", line: &line)
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
                if modeOfDifficulty == "Easy" {
                    score.computerScoreEasy += 1
                }
                else if modeOfDifficulty == "Medium" {
                    score.computerScoreMedium += 1
                }
                else if modeOfDifficulty == "Hard" {
                    score.computerScoreHard += 1
                }
                else if modeOfDifficulty == "Impossible" {
                    score.computerScoreImpossible += 1
                }
                isGameBoardDisabled = false
                return
            }
            if checkForWin(move: moves, piece: "xmark", line: &line) { // CHANGED: || checkForWin(move: moves, piece: "circle", line: &line)
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
                if modeOfDifficulty == "Easy" {
                    score.playerScoreEasy += 1
                }
                else if modeOfDifficulty == "Medium" {
                    score.playerScoreMedium += 1
                }
                else if modeOfDifficulty == "Hard" {
                    score.playerScoreHard += 1
                }
                else if modeOfDifficulty == "Impossible" {
                    score.playerScoreImpossible += 1
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
            return true
        }
        else if checkForWin(move: moves, piece: "circle", line: &line) {
            score.twoPlayer2 += 1
            alertItem = AlertContext.player2win
            turnDecider = true
            return true
        }
        else if checkForDraw(move: moves) {
            alertItem = AlertContext.draw
            turnDecider = true
            draw = true
            return true
        }
        return false
    }
}

struct colorTest_Previews: PreviewProvider {
    static var previews: some View {
        colorTest(modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: "Avnoor",
                  player2Name: "Rahul",
                  color0: Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)),
                  colorX: Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)),
                  twoPlayerTurnDecider: true,
                  twoPlayerTurnDeciderForResetFunc: true)
    }
}
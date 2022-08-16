////
////  gametest.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 8/8/22.
////
//
//import SwiftUI
//
//struct gametest: View {
//    let layout: [GridItem]  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    @State private var isGameBoardDisabled = false
//    @State private var alertItem: AlertItem?
//    @State var moves: [Move?] = Array(repeating: nil , count: 9)
//    @State private var count: Int = 0
//    @State var line: Int = 0
//    @State private var leftdwin: Bool = false
//    @State private var rightdwin: Bool = false
//    @State private var horizwin: Bool = false
//    @State private var vertwin: Bool = false
//    @State private var draw: Bool = false
//    @State private var computerWin: Bool = false
//    @State private var userMovewin: Bool = false
//    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
//
//
//    @Binding var sound: Bool
//
//    // init()
//    let modeOfDifficulty: String
//    let onePlayerPieceDecider: Bool
//    let player1Name: String
////    let pieceType: String
//    let player2Name: String  // THIS IS WHATEVER PIECE PLAYER 1 PICKED
//    @State var twoPlayerTurnDecider: Bool
//    @State var twoPlayerTurnDeciderForResetFunc: Bool
//
//    @State var playerScoreEasy: Double = 0
//    @State var playerScoreMedium: Double = 0
//    @State var playerScoreHard: Double = 0
//    @State var playerScoreImpossible: Double = 0
//    @State var computerScoreEasy: Double = 0
//    @State var computerScoreMedium: Double = 0
//    @State var computerScoreHard: Double = 0
//    @State var computerScoreImpossible: Double = 0
//    @State var twoPlayer1: Double = 0
//    @State var twoPlayer2: Double = 0
//
//    var body: some View {
//        ZStack {
//            background
//                .ignoresSafeArea(.all)
//            GeometryReader  { geometry in
//                VStack {
//                    Spacer()
//                    ZStack {
//                        LazyVGrid(columns: layout, spacing: 10) {
//                            ForEach(0..<9)  { i in
//
//                                ZStack  {
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .foregroundColor(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
//                                        .frame(width: geometry.size.width/3 - 15,
//                                               height: geometry.size.width/3 - 15)
//                                        .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
//                                    if (moves[i] != nil) {
//                                        if moves[i]?.indicator == "xmark" {
//                                            AnimatedXmarkView(sound: $sound)
//                                        }
//                                        else if moves[i]?.indicator == "circle" {
//                                            AnimatedCircleView(sound: $sound)
//                                        }
//                                    }
//                                }
//                                .onTapGesture {
//
//                                    // TWO PLAYER MODE
//                                    if modeOfDifficulty == "twoplayer" {
//                                        if twoPlayerMode(index: i, turnDecider: &twoPlayerTurnDeciderForResetFunc) {
//                                            twoPlayerTurnDeciderForResetFunc.toggle()
//                                        }
//                                        if twoPlayerModeGameEndChecker(turnDecider: &twoPlayerTurnDeciderForResetFunc) {
//                                            if draw {
//                                                return
//                                            }
//                                            else if line == 0 || line == 1 || line == 2 {
//                                                horizwin = true
//                                            }
//                                            else if line == 3 || line == 4 || line == 5 {
//                                                vertwin = true
//                                            }
//                                            else if line == 6 {
//                                                leftdwin = true
//                                            }
//                                            else if line == 7 {
//                                                rightdwin = true
//                                            }
//                                            return
//                                        }
//                                    }
//
//                                    // ONE PLAYER MODE
//
//                                    else {
//                                        if userMove(index: i) {
//                                            return
//                                        }
//
//                                        if userMoveWinChecker() {
//                                            if draw {
//                                                return
//                                            }
//                                            if line == 0 || line == 1 || line == 2 {
//                                                horizwin = true
//                                            }
//                                            else if line == 3 || line == 4 || line == 5 {
//                                                vertwin = true
//                                            }
//                                            else if line == 6 {
//                                                leftdwin = true
//                                            }
//                                            else if line == 7 {
//                                                rightdwin = true
//                                            }
//                                            return
//                                        }
//                                        // computer's move
//                                        computerMove(computerPiece: player2Name == "xmark" ? "circle" : "xmark")
//                                    }
//                                }
//                            }
//                        }
//
//                        /// END OF LAZY V GRID
//
//                        if leftdwin {
//                            LeftDiagonalWin()
//                        }
//                        else if rightdwin {
//                            RightDiagonalWin()
//                        }
//                        else if horizwin {
//                            if line == 0 {
//                                HorizontalWin(spacing: -120)
//                            }
//                            else if line == 1 {
//                                HorizontalWin(spacing: 0)
//                            }
//                            else if line == 2 {
//                                HorizontalWin(spacing: 120)
//                            }
//                        }
//                        else if vertwin {
//                            if line == 3 {
//                                VerticalWin(spacing: -120)
//                            }
//                            else if line == 4 {
//                                VerticalWin(spacing: 0)
//                            }
//                            else if line == 5 {
//                                VerticalWin(spacing: 120)
//                            }
//                        }
//                    }
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        VStack {
//                            if modeOfDifficulty == "easy" {
//                                Text("\(Int(playerScoreEasy))")
//                            }
//                            else if modeOfDifficulty == "medium" {
//                                Text("\(Int(playerScoreMedium))")
//                            }
//                            else if modeOfDifficulty == "hard" {
//                                Text("\(Int(playerScoreHard))")
//                            }
//                            else if modeOfDifficulty == "impossible" {
//                                Text("\(Int(playerScoreImpossible))")
//                            }
//                            else if modeOfDifficulty == "twoplayer" {
//                                Text("\(Int(twoPlayer1))")
//                            }
//                            Image(systemName: "xmark")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.blue)
//                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
//                            if modeOfDifficulty == "twoplayer" {
//                                Text(player1Name)
//                            }
//                            else {
//                                if player2Name == "xmark" {
//                                    Text(player1Name)
//                                }
//                                else {
//                                    Text("Computer")
//                                }
//                            }
//                        }
//                        Spacer()
//                        VStack {
//                            if modeOfDifficulty == "easy" {
//                                Text("\(Int(computerScoreEasy))")
//                            }
//                            else if modeOfDifficulty == "medium" {
//                                Text("\(Int(computerScoreMedium))")
//                            }
//                            else if modeOfDifficulty == "hard" {
//                                Text("\(Int(computerScoreHard))")
//                            }
//                            else if modeOfDifficulty == "impossible" {
//                                Text("\(Int(computerScoreImpossible))")
//                            }
//                            else if modeOfDifficulty == "twoplayer" {
//                                Text("\(Int(twoPlayer2))")
//                            }
//                            Image(systemName: "circle")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.blue)
//                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
//                            if modeOfDifficulty == "twoplayer" {
//                                Text(player2Name)
//                            }
//                            else {
//                                if player2Name == "circle" {
//                                    Text(player1Name)
//                                }
//                                else {
//                                    Text("Computer")
//                                }
//                            }
//                        }
//                        Spacer()
//                    }
//                    Spacer()
//                    HStack {
//                        ZStack {
////                            RoundedRectangle(cornerRadius: 15)
////                                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
////                                .frame(width: 110, height: 40)
//                            Button {
//                                resetScore()
//                            } label: {
//                                Text("Reset Score")
//                            }
//                        }
//                        Spacer()
//                        ZStack {
////                            RoundedRectangle(cornerRadius: 15)
////                                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
////                                .frame(width: 110, height: 40)
//                            Button {
//                                resetGame(moves: &moves)
//                            } label: {
//                                Text("Reset Game")
//                            }
//                        }
//
//                    }
//                    Spacer()
//                }
//                .disabled(isGameBoardDisabled)
//                .padding()
//                .alert(item: $alertItem, content: {alertItem in
//                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action:
//                        {
//                        resetGame(moves: &moves)
//                        if sound {
//                            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "background")
//                        }
//                        if leftdwin { leftdwin = false }
//                        if rightdwin { rightdwin = false }
//                        if horizwin { horizwin = false }
//                        if vertwin { vertwin = false }
//                        if draw { draw = false }
//                    }))
//                })
//            }
//        }
//    }
//
//
//    ////////////////////////////////////////////////////////////////      FUNCTIONS //////////////////////////////// ////////////////////////////////
//
//    func resetGame(moves: inout [Move?]) {
//        moves = Array(repeating: nil, count: 9)
//        twoPlayerTurnDeciderForResetFunc = twoPlayerTurnDecider
//    }
//
//    func resetScore() {
//        if modeOfDifficulty == "easy" {
//            playerScoreEasy = 0
//            computerScoreEasy = 0
//        }
//        else if modeOfDifficulty == "medium" {
//            playerScoreMedium = 0
//            computerScoreMedium = 0
//        }
//        else if modeOfDifficulty == "hard" {
//            playerScoreHard = 0
//            computerScoreHard = 0
//        }
//        else if modeOfDifficulty == "impossible" {
//            playerScoreImpossible = 0
//            computerScoreImpossible = 0
//        }
//        else if modeOfDifficulty == "twoplayer" {
//            twoPlayer1 = 0
//            twoPlayer2 = 0
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
//            if modeOfDifficulty == "easy" {
//                playerScoreEasy += 0.5
//            }
//            else if modeOfDifficulty == "medium" {
//                playerScoreMedium += 0.5
//            }
//            else if modeOfDifficulty == "hard" {
//                playerScoreHard += 0.5
//            }
//            else if modeOfDifficulty == "impossible" {
//                playerScoreImpossible += 0.5
//            }
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        if checkForWin(move: moves, piece: "circle", line: &line) {  // CHANGED: checkForWin(move: moves, piece: "xmark", line: &line) ||
//            userMovewin = true
//
//            alertItem = AlertContext.humanWin
//
//            if modeOfDifficulty == "easy" {
//                computerScoreEasy += 0.5
//            }
//            else if modeOfDifficulty == "medium" {
//                computerScoreMedium += 0.5
//            }
//            else if modeOfDifficulty == "hard" {
//                computerScoreHard += 0.5
//            }
//            else if modeOfDifficulty == "impossible" {
//                computerScoreImpossible += 0.5
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
//            if modeOfDifficulty == "easy" {
//                easyComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "medium" {
//                mediumComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "hard" {
//                hardComputerMove(move: &moves, turn: onePlayerPieceDecider, computerPiece: computerPiece, playerPiece: player2Name)
//            }
//            else if modeOfDifficulty == "impossible" {
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
//                if modeOfDifficulty == "easy" {
//                    computerScoreEasy += 1
//                }
//                else if modeOfDifficulty == "medium" {
//                    computerScoreMedium += 1
//                }
//                else if modeOfDifficulty == "hard" {
//                    computerScoreHard += 1
//                }
//                else if modeOfDifficulty == "impossible" {
//                    computerScoreImpossible += 1
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
//                if modeOfDifficulty == "easy" {
//                    playerScoreEasy += 1
//                }
//                else if modeOfDifficulty == "medium" {
//                    playerScoreMedium += 1
//                }
//                else if modeOfDifficulty == "hard" {
//                    playerScoreHard += 1
//                }
//                else if modeOfDifficulty == "impossible" {
//                    playerScoreImpossible += 1
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
//            twoPlayer1 += 1
//            turnDecider = true
//            if sound {
//                MusicPlayer.shared.playSoundEffect(soundEffect: "win")
//            }
//            return true
//        }
//        else if checkForWin(move: moves, piece: "circle", line: &line) {
//            twoPlayer2 += 1
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
//
//struct gametest_Previews: PreviewProvider {
//    static var previews: some View {
//        gametest(sound: .constant(true), modeOfDifficulty: "easy", onePlayerPieceDecider: true, player1Name: "Avnoor", player2Name: "xmark", twoPlayerTurnDecider: true, twoPlayerTurnDeciderForResetFunc: true)
//    }
//}

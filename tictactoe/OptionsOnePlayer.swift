//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI
import CoreMedia

struct OptionsOnePlayer: View {
    @Binding var score: scores
    @Binding var sound: Bool
    @Binding var numPlayers: Int
    @State var textFieldText1: String = ""
    @State var pieceType: String = ""
//    @State var textFieldText2: String = ""
    @State var modeOfDifficulty: String = ""
    @State var xORo: Bool = true
    @State var clickedX: Bool = false
    @State var clickedO: Bool = false
    @State var clickedEasy: Bool = false
    @State var clickedMedium: Bool = false
    @State var clickedHard: Bool = false
    @State var clickedImpossible: Bool = false
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Select Difficulty")
                    .font(.title)
                    .padding()
                Button {
                    modeOfDifficulty = "easy"
                    clickedEasy = true
                    clickedMedium = false
                    clickedHard = false
                    clickedImpossible = false
                } label: {
                    ZStack {
                        if clickedEasy {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 45, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Easy")
                    }
                }
                Button {
                    modeOfDifficulty = "medium"
                    clickedEasy = false
                    clickedMedium = true
                    clickedHard = false
                    clickedImpossible = false
                } label: {
                    ZStack {
                        if clickedMedium {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 70, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Medium")
                    }
                }
                Button {
                    modeOfDifficulty = "hard"
                    clickedEasy = false
                    clickedMedium = false
                    clickedHard = true
                    clickedImpossible = false
                } label: {
                    ZStack {
                        if clickedHard {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 45, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Hard")
                    }
                }
                Button {
                    modeOfDifficulty = "impossible"
                    clickedEasy = false
                    clickedMedium = false
                    clickedHard = false
                    clickedImpossible = true
                } label: {
                    ZStack {
                        if clickedImpossible {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 90, height: 25)
                                .foregroundColor(.white)
                        }
                        Text("Impossible")
                    }
                }
            }
            Spacer()
            VStack {
                Text("Pick a Side")
                    .font(.title)
                    .padding()
                HStack {
                    Spacer()
                    Button  {
                        clickedX = true
                        clickedO = false
                        xORo = true
                        pieceType = "xmark"
                        score.computerScoreEasy = 0
                        score.computerScoreMedium = 0
                        score.computerScoreHard = 0
                        score.computerScoreImpossible = 0
                        score.playerScoreEasy = 0
                        score.playerScoreMedium = 0
                        score.playerScoreHard = 0
                        score.playerScoreImpossible = 0
                    } label: {
                        ZStack {
                            if clickedX {
                                Rectangle()
                                    .stroke(.black)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "xmark")
                                .resizable()
                            .frame(width: 40, height: 40)
                        }
                    }
                    Spacer()
                    Button {
                        clickedO = true
                        clickedX = false
                        xORo = false
                        pieceType = "circle"
                        score.computerScoreEasy = 0
                        score.computerScoreMedium = 0
                        score.computerScoreHard = 0
                        score.computerScoreImpossible = 0
                        score.playerScoreEasy = 0
                        score.playerScoreMedium = 0
                        score.playerScoreHard = 0
                        score.playerScoreImpossible = 0
                    } label: {
                        ZStack {
                            if clickedO {
                                Rectangle()
                                    .stroke(.black)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "circle")
                                .resizable()
                            .frame(width: 40, height: 40)
                        }
                    }
                    Spacer()
                }
            }
            Spacer()
            if clickedO {
                VStack {
                    Text("Change Name")
                        .font(.title)
                    .padding()
                    HStack {
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, nil)
                        TextField("Player", text: $textFieldText1)
                            .padding()
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            .padding(.leading, nil)
                            .padding(.trailing, nil)
                            .font(.headline)
                    }
                }
                
            }
            else if clickedX {
                Text("Change Name")
                    .font(.title)
                    .padding()
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, nil)
                    TextField("Player", text: $textFieldText1)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .padding(.leading, nil)
                        .padding(.trailing, nil)
                        .font(.headline)
                }
            }
//            VStack {
//                Text("Change Name")
//                    .font(.title)
//                    .padding()
//                HStack {
//                    Image(systemName: "xmark")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .padding(.leading, nil)
//                    TextField("Player", text: $textFieldText1)
//                        .padding()
//                        .background(Color.gray.opacity(0.3).cornerRadius(10))
//                        .padding(.leading, nil)
//                        .padding(.trailing, nil)
//                        .font(.headline)
//                }
//                HStack {
//                    Image(systemName: "circle")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .padding(.leading, nil)
//                    TextField("Computer", text: $textFieldText2)
//                        .padding()
//                        .background(Color.gray.opacity(0.3).cornerRadius(10))
//                        .padding(.leading, nil)
//                        .padding(.trailing, nil)
//                        .font(.headline)
//                }
                
//            }
//            Spacer()
            VStack {
//                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: modeOfDifficulty, onePlayerPieceDecider: xORo, player1Name: textFieldText1, player2Name: textFieldText2, twoPlayerTurnDecider: true)) {
//                    Text("Continue")
//                }
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: modeOfDifficulty, onePlayerPieceDecider: xORo, player1Name: textFieldText1, player2Name: pieceType, twoPlayerTurnDecider: true, twoPlayerTurnDeciderForResetFunc: true)) {
                    Text("Continue")
                }
//                .simultaneousGesture(TapGesture().onEnded({ _ in
//                    if textFieldText1 == "" {
//                        textFieldText1 = "Computer"
//                    }
//                    else if textFieldText2 == "" {
//                        textFieldText2 = "Computer"
//                    }
//                }))
            }
        }
    }
}

//struct SelectDifficulty_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectDifficulty(score: scores)
//    }
//}


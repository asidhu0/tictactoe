//
//  OptionsTwoPlayers.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/6/22.
//

import SwiftUI

struct OptionsTwoPlayers: View {
    @Binding var score: scores
    @Binding var sound: Bool
    @State var textFieldText1: String = ""
    @State var textFieldText2: String = ""
    @State var turnPicker: Bool
    @State private var pickedX: Bool = false
    @State private var pickedO: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text("Change Name")
                .font(.title)
                .padding()
            HStack {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, nil)
                TextField("Player 1", text: $textFieldText1)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .padding(.leading, nil)
                    .padding(.trailing, nil)
                    .font(.headline)
            }
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, nil)
                TextField("Player 2", text: $textFieldText2)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .padding(.leading, nil)
                    .padding(.trailing, nil)
                .font(.headline)
            }
            Spacer()
            Text("Pick who goes first")
                .font(.title)
                .padding()
            HStack {
                Spacer()
                Button {
                    turnPicker = true
                    pickedX = true
                    pickedO = false
                } label: {
                    ZStack {
                        if pickedX {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        }
                        Image(systemName: "xmark")
                            .resizable()
                        .frame(width: 50, height: 50)
                    }
                }
                Spacer()
                Button {
                    turnPicker = false
                    pickedX = false
                    pickedO = true
                } label: {
                    ZStack {
                        if pickedO {
                            Rectangle()
                                .stroke(.black)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        }
                        Image(systemName: "circle")
                            .resizable()
                        .frame(width: 50, height: 50)
                    }
                }
                Spacer()
            }
//            NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: textFieldText1, player2Name: textFieldText2, twoPlayerTurnDecider: turnPicker, twoPlayerTurnDeciderForResetFunc: turnPicker)) {
//                Text("Continue")
//            }
            NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: textFieldText1, player2Name: textFieldText2, color0: .orange, colorX: .yellow, twoPlayerTurnDecider: turnPicker, twoPlayerTurnDeciderForResetFunc: turnPicker)) {
                Text("Continue")
            }
            Spacer()
        }
        .navigationTitle("")
    }
}
//
//struct OptionsTwoPlayers_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsTwoPlayers()
//    }
//}

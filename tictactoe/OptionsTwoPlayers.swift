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
    var body: some View {
        VStack {
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
            NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: textFieldText1, player2Name: textFieldText2)) {
                Text("Continue")
            }
        }
    }
}
//
//struct OptionsTwoPlayers_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsTwoPlayers()
//    }
//}

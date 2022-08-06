//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct SelectDifficulty: View {
    @Binding var score: scores
    @Binding var sound: Bool
    @Binding var numPlayers: Int
    var body: some View {
            VStack {
                Spacer()
                Text("Select Difficulty")
                    .font(.title)
                    .padding()
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "easy")) {
                    Text("Easy")
                }
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "medium")) {
                    Text("Medium")
                }
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "hard")) {
                    Text("Hard")
                }
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "impossible")) {
                    Text("Impossible")
                }
                Spacer()
            }
    }
}

//struct SelectDifficulty_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectDifficulty(score: scores)
//    }
//}


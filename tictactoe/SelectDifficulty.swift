//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct SelectDifficulty: View {
    @Binding var score: scores
    var body: some View {
            VStack {
                Spacer()
                Text("Select Difficulty")
                    .font(.title)
                    .padding()
                NavigationLink(destination: GameBoard(
                    score: $score,
                    modeOfDifficulty: "easy")) {
                    Text("Easy")
                }
                NavigationLink(destination: GameBoard(
                    score: $score,
                    modeOfDifficulty: "medium")) {
                    Text("Medium")
                }
                NavigationLink(destination: GameBoard(
                    score: $score,
                    modeOfDifficulty: "hard")) {
                    Text("Hard")
                }
                Spacer()
            }
    }
}

//struct SelectDifficulty_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectDifficulty(score: $score)
//    }
//}


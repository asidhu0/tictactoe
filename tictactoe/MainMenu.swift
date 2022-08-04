//
//  MainMenu.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct MainMenu: View {
    @State var score: scores = scores(playerScoreEasy: 0, playerScoreMedium: 0, playerScoreHard: 0, computerScoreEasy: 0, computerScoreMedium: 0, computerScoreHard: 0)
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Tic Tac Toe")
                    .font(.title)
                    .padding()
                NavigationLink(destination: SelectDifficulty(score: $score)) {
                    Text("One Player")
                }
//                NavigationLink(destination: SelectDifficulty()) {
//                    Text("Two Player")
//                }
                Image(systemName: "speaker")
                    .padding(.top, 15)
                Spacer()
            }
            .toolbar {
                Image(systemName: "gear")
            }
//            .onTapGesture {
//                <#code#>
//            }
        }
    }
    
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

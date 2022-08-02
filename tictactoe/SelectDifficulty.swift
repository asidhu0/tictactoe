//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct SelectDifficulty: View {
    var body: some View {
//        NavigationView {
            VStack {
                Spacer()
                Text("Tic Tac Toe")
                    .font(.title)
                    .padding()
                NavigationLink(destination: EasyMode()) {
                    Text("Easy")
                }
                NavigationLink(destination: MediumMode()) {
                    Text("Medium")
                }
                NavigationLink(destination: HardMode()) {
                    Text("Hard")
                }
                Spacer()
            }
//        }
    }
}

struct SelectDifficulty_Previews: PreviewProvider {
    static var previews: some View {
        SelectDifficulty()
    }
}

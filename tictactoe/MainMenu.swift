//
//  MainMenu.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Text("Tic Tac Toe")
                    .font(.title)
                    .padding()
                NavigationLink(destination: SelectDifficulty()) {
                    Text("One Player")
                }
                Spacer()
            }
        }
    }
    
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

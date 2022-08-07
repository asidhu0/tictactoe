//
//  MainMenu.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct MainMenu: View {
    @State var score: scores = scores(playerScoreEasy: 0, playerScoreMedium: 0, playerScoreHard: 0, playerScoreImpossible: 0, computerScoreEasy: 0, computerScoreMedium: 0, computerScoreHard: 0, computerScoreImpossible: 0, twoPlayer1: 0, twoPlayer2: 0)
    @State var sound: Bool = true
    @State var numPlayers: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Tic Tac Toe")
                    .font(.title)
                    .padding()
                NavigationLink(destination: OptionsOnePlayer(score: $score, sound: $sound, numPlayers: $numPlayers)) {
                    Text("One Player")
                }
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    numPlayers = 1
                }))
                NavigationLink(destination: OptionsTwoPlayers(score: $score, sound: $sound)) {
                    Text("Two Player")
                }
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    numPlayers = 2
                }))
                Button {
                    sound.toggle()
                    if sound {
                        MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "background")
                    }
                    else if !sound {
                        MusicPlayer.shared.stopBackgroundMusic()
                    }
                } label: {
                    if sound {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding(.top, 15)
                    }
                    else if !sound {
                        Image(systemName: "speaker.fill")
                            .padding(.top, 15)
                    }
                }
                Spacer()
            }
        }
    }
    
}
//
//struct MainMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenu()
//    }
//}

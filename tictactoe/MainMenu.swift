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
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
    var body: some View {
            NavigationView {
                ZStack {
                    background
                        .ignoresSafeArea(.all)
                    VStack {
                        Text("Tic")
                            .font(.custom("GAMERIA", size: 130, relativeTo: .largeTitle))
                            .foregroundColor(Color.blue)
                            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                            .padding(.top, nil)
                        Text("Tac")
                            .font(.custom("GAMERIA", size: 130, relativeTo: .largeTitle))
                            .foregroundColor(Color.blue)
                            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                        Text("Toe")
                            .font(.custom("GAMERIA", size: 130, relativeTo: .largeTitle))
                            .foregroundColor(Color.blue)
                            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                            .padding(.bottom, nil)
                        NavigationLink(destination: OptionsOnePlayer(score: $score, sound: $sound, numPlayers: $numPlayers)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                                    .frame(width: 250)
                                Text("One Player")
                                    .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                                    .foregroundColor(.cyan)
                                    .padding()
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded({ _ in
                            numPlayers = 1
                        }))
                        NavigationLink(destination: OptionsTwoPlayers(score: $score, sound: $sound, turnPicker: true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                                    .frame(width: 250)
                                Text("Two Player")
                                    .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                                    .foregroundColor(.cyan)
                                    .padding()
                                
                            }
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
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                            .padding(.top, 15)
                                            .padding(.trailing, 15)
                            }
                            else if !sound {
                                VStack {
                                    HStack {
                                        Image(systemName: "speaker.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                            .padding(.top, 15)
                                            .padding(.trailing, 15)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
    }
    
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

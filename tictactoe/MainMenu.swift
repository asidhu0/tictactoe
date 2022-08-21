//
//  MainMenu.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

struct MainMenu: View {
    @StateObject var viewModel = MainMenuViewModel()
    var body: some View {
            NavigationView {
                ZStack {
                    viewModel.background
                        .ignoresSafeArea(.all)
                    VStack {
                        TicTacToeTitle()
                        NavigationLink(destination: OptionsOnePlayer(score: $viewModel.score, sound: $viewModel.sound, numPlayers: $viewModel.numPlayers)) {
                            OnePlayerButtonView()
                        }
                        .simultaneousGesture(TapGesture().onEnded({ _ in
                            viewModel.numPlayers = 1
                        }))
                        NavigationLink(destination: OptionsTwoPlayers(score: $viewModel.score, sound: $viewModel.sound, turnPicker: true)) {
                            TwoPlayerButtonView()
                        }
                        .simultaneousGesture(TapGesture().onEnded({ _ in
                            viewModel.numPlayers = 2
                        }))
                        Button {
                            viewModel.sound.toggle()
                            viewModel.sound ? MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "background") : MusicPlayer.shared.stopBackgroundMusic()
                        } label: {
                            SoundButtonView(systemImageName: viewModel.sound ? "speaker.wave.3.fill" : "speaker.fill")
                        }
                    }
                }
                .navigationTitle("")
            }
            .accentColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

struct TicTacToeTitle: View {
    var body: some View {
        VStack {
            Text("Tic")
                .padding(.top, nil)
            Text("Tac")
            Text("Toe")
                .padding(.bottom, nil)
        }
        .font(.custom("GAMERIA", size: 130, relativeTo: .largeTitle))
        .foregroundColor(Color.blue)
        .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
    }
}

struct OnePlayerButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 250)
            Text("One Player")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
                .padding()
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TwoPlayerButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 250)
            Text("Two Player")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
                .padding()
            
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SoundButtonView: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
            .padding(.top, 15)
    }
}

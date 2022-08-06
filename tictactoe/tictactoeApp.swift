//
//  tictactoeApp.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI

@main
struct tictactoeApp: App {
    init() {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "background")
    }
    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}

//
//  Setup.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI
import AVKit

enum Player {
    case human, computer
}

struct Move: Identifiable {
    let id = UUID()
    let player: Player
    let boardIndex: Int
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct scores {
    var playerScoreEasy: Double
    var playerScoreMedium: Double
    var playerScoreHard: Double
    var playerScoreImpossible: Double
    var computerScoreEasy: Double
    var computerScoreMedium: Double
    var computerScoreHard: Double
    var computerScoreImpossible: Double
    var twoPlayer1: Double
    var twoPlayer2: Double
}


class SoundManager {  // Sounds from Zapsplat.com
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case pop
        case win
        case circle
        case xmark
        case lose
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

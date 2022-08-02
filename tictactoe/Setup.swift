//
//  Setup.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI

enum Player {
    case human, computer
}

struct Move: Identifiable {
    let id = UUID()
    let player: Player
    let boardIndex: Int
    var checkIfOccupied: Bool = false
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

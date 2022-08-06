//
//  Alerts.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin    = AlertItem(title: Text("You Win!"),
                                message: Text("Good job"),
                                buttonTitle: Text("Play Again!"))
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                message: Text("NOOOO"),
                                buttonTitle: Text("Try Again"))
    static let draw        = AlertItem(title: Text("Draw!"),
                                message: Text("No good"),
                                buttonTitle: Text("Try Again"))
    static let player1win  = AlertItem(title: Text("Player 1 Wins!"),
                                message: Text("Wow!"),
                                buttonTitle: Text("Try Again"))
    static let player2win  = AlertItem(title: Text("Player 2 Wins!"),
                                message: Text("Wow!"),
                                buttonTitle: Text("Try Again"))
}

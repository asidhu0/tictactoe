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
    static let humanWin    = AlertItem(title: Text("You Won!"),
                                message: Text("Congratulations!"),
                                buttonTitle: Text("Play Again"))
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                message: Text("Better luck next time!"),
                                buttonTitle: Text("Try Again"))
    static let draw        = AlertItem(title: Text("Draw!"),
                                message: Text("No good"),
                                buttonTitle: Text("Try Again"))
    static let player1win  = AlertItem(title: Text("X Wins!"),
                                message: Text("Wow!"),
                                buttonTitle: Text("Play Again"))
    static let player2win  = AlertItem(title: Text("O Wins!"),
                                message: Text("Wow!"),
                                buttonTitle: Text("Play Again"))
}

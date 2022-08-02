//
//  ComputerMoves.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI
/*
Board Indices:
    0 1 2
    3 4 5
    6 7 8
 */

func easyComputerMove(in move: [Move?]) {
    if computerCanWin(in: move) {
        return
    }
    if computerCanBlock(in: move) {
        return
    }
    randomComputerMove(in: move)
}

func mediumComputerMove(in move: [Move?]) {
    if computerCanWin(in: move) {
        return
    }
    if computerCanBlock(in: move) {
        return
    }
    if computerTakeMiddleSquare() {
        return
    }
    randomComputerMove(in: move)
}

func hardComputerMove(in move: [Move?]) {
    if computerCanWin(in: move) {
        return
    }
    if computerCanBlock(in: move) {
        return
    }
    if computerTakeMiddleSquare() {
        return
    }
    if playerTakesIndex4First() {  // center
        return
    }
    if playerTakesIndex0First() {  // upper left hand corner
        return
    }
    if playerTakesIndex2First() {  // upper right hand corner
        return
    }
    if playerTakesIndex6First() {  // lower left hand corner
        return
    }
    if playerTakesIndex8First() {  // lower right hand corner
        return
    }
    if playerTakesIndex1First() {
        return
    }
    if playerTakesIndex3First() {
        return
    }
    if playerTakesIndex5First() {
        return
    }
    if playerTakesIndex7First() {
        return
    }
    randomComputerMove(in: move)
}

func computerCanWin(in move: [Move?]) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanWinHelper(in: winPatterns[i])
        if win {
            return true
        }
    }
    return false
}

func computerCanWinHelper(in combo: [Int]) -> Bool {
    if moves[combo[0]]?.indicator == "circle" && moves[combo[1]]?.indicator == "circle" && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: .computer, boardIndex: combo[2], checkIfOccupied: true)
        return true
    }
    else if moves[combo[1]]?.indicator == "circle" && moves[combo[2]]?.indicator == "circle" && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: .computer, boardIndex: combo[0], checkIfOccupied: true)
        return true
    }
    else if moves[combo[0]]?.indicator == "circle" && moves[combo[2]]?.indicator == "circle" && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: .computer, boardIndex: combo[1], checkIfOccupied: true)
        return true
    }
    return false
}

func computerCanBlock(in move: [Move?]) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanBlockHelper(in: winPatterns[i])
        if win {
            return true
        }
    }
    return false
}

func computerCanBlockHelper(in combo: [Int]) -> Bool {
    if moves[combo[0]]?.indicator == "xmark" && moves[combo[1]]?.indicator == "xmark" && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: .computer, boardIndex: combo[2], checkIfOccupied: true)
        return true
    }
    else if moves[combo[1]]?.indicator == "xmark" && moves[combo[2]]?.indicator == "xmark" && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: .computer, boardIndex: combo[0], checkIfOccupied: true)
        return true
    }
    else if moves[combo[0]]?.indicator == "xmark" && moves[combo[2]]?.indicator == "xmark" && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: .computer, boardIndex: combo[1], checkIfOccupied: true)
        return true
    }
    return false
}

func computerTakeMiddleSquare() -> Bool {
    if moves[4] == nil {
        moves[4] = Move(player: .computer, boardIndex: 4, checkIfOccupied: true)
        return true
    }
    return false
}

func randomComputerMove(in move: [Move?]) {
    var computerPosition = Int.random(in: 0..<9)
    var positionCheckComputer: Bool = true
    while positionCheckComputer {
        if moves[computerPosition]?.checkIfOccupied == true{
            computerPosition = Int.random(in: 0..<9)
        }
        else {
        moves[computerPosition] = Move(player: .computer,
                                       boardIndex: computerPosition,
                                       checkIfOccupied: true)
            positionCheckComputer = false
        }
    }
}
// playerTakesIndex0First: player takes index 0, AI takes index 4
// playerTakesIndex0First #1: Player takes index 8
// playerTakesIndex0First #2: Player takes index 5
// playerTakesIndex0First #3: Player takes index 7

func playerTakesIndex0First() -> Bool{  // index 0 is taken by player and index 4 is taken by AI
        if moves[0]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[8]?.indicator == "xmark" && moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex0First #1
            let combo: [Int] = [1, 3, 5, 7]
            let computerPosition = Int.random(in: 0..<4)
            moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
            return true
        }
        if moves[0]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[5]?.indicator == "xmark" &&
            moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex0First #2
            moves[8] = Move(player: .computer, boardIndex: 8, checkIfOccupied: true)
            return true
        }
        // case 1_3
        if moves[0]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[7]?.indicator == "xmark" &&
            moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex0First #3
            moves[8] = Move(player: .computer, boardIndex: 8, checkIfOccupied: true)
            return true
        }
    return false
}

// playerTakesIndex2First: player takes index 2, AI takes index 4
// playerTakesIndex2First #1: Player takes index 6
// playerTakesIndex2First #2: Player takes index 3
// playerTakesIndex2First #3: Player takes index 7

func playerTakesIndex2First() -> Bool {  // index 2 is taken by player and index 4 is taken by AI
        if moves[2]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[6]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex2First #1
            let combo: [Int] = [1, 3, 5, 7]
            let computerPosition = Int.random(in: 0..<4)
            moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
            return true
        }
        if moves[2]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[3]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[5] == nil &&
            moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex2First #2
            moves[6] = Move(player: .computer, boardIndex: 6, checkIfOccupied: true)
            return true
        }
        if moves[2]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[7]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex2First #3
            moves[6] = Move(player: .computer, boardIndex: 6, checkIfOccupied: true)
            return true
        }
    return false
}

// playerTakesIndex8First: player takes index 8, AI takes index 4
// playerTakesIndex8First #1: Player takes index 0
// playerTakesIndex8First #2: Player takes index 3
// playerTakesIndex8First #3: Player takes index 1

func playerTakesIndex8First() -> Bool {  // index 8 is taken by player and index 4 is taken by AI
        if moves[8]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[0]?.indicator == "xmark" &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #1
            let combo: [Int] = [1, 3, 5, 7]
            let computerPosition = Int.random(in: 0..<4)
            moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
            return true
        }
        if moves[8]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[3]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[2] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #2
            moves[0] = Move(player: .computer, boardIndex: 0, checkIfOccupied: true)
            return true
        }
        if moves[8]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[1]?.indicator == "xmark" &&
            moves[0] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #3
            moves[0] = Move(player: .computer, boardIndex: 0, checkIfOccupied: true)
            return true
        }
    return false
}

// playerTakesIndex6First: player takes index 6, AI takes index 4
// playerTakesIndex6First #1: Player takes index 2
// playerTakesIndex6First #2: Player takes index 5
// playerTakesIndex6First #3: Player takes index 1

func playerTakesIndex6First() -> Bool {  // index 6 is taken by player and index 4 is taken by AI
        if moves[6]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[2]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First 4_1
            let combo: [Int] = [1, 3, 5, 7]
            let computerPosition = Int.random(in: 0..<4)
            moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
            return true
        }
        if moves[6]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[5]?.indicator == "xmark" &&
            moves[0] == nil && moves[1] == nil && moves[2] == nil &&
            moves[3] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First 4_2
            moves[2] = Move(player: .computer, boardIndex: 2, checkIfOccupied: true)
            return true
        }
        if moves[6]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[1]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First 4_3
            moves[2] = Move(player: .computer, boardIndex: 2, checkIfOccupied: true)
            return true
        }
    return false
}

func playerTakesIndex4First() -> Bool {
    if moves[4]?.indicator == "xmark" && moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[5] == nil && moves[6] == nil && moves[7] == nil && moves[8] == nil {
        let combo: [Int] = [0, 2, 6, 8]
        let computerPosition = Int.random(in: 0..<4)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[4]?.indicator == "xmark" && moves[0]?.indicator == "circle" && moves[8]?.indicator == "xmark" &&
        moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {
        let combo: [Int] = [2, 6]
        let computerPosition = Int.random(in: 0..<2)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[4]?.indicator == "xmark" && moves[2]?.indicator == "circle" && moves[6]?.indicator == "xmark" &&
        moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {
        let combo: [Int] = [0, 8]
        let computerPosition = Int.random(in: 0..<2)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[4]?.indicator == "xmark" && moves[6]?.indicator == "circle" && moves[2]?.indicator == "xmark" &&
        moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {
        let combo: [Int] = [0, 8]
        let computerPosition = Int.random(in: 0..<2)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[4]?.indicator == "xmark" && moves[8]?.indicator == "circle" && moves[0]?.indicator == "xmark" &&
        moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {
        let combo: [Int] = [2, 6]
        let computerPosition = Int.random(in: 0..<2)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    return false
}

// playerTakesIndex3First: player takes index 3, AI takes index 4
// playerTakesIndex3First #1: Player takes index 0 (random AI moves will draw)
// playerTakesIndex3First #2: Player takes index 1
// playerTakesIndex3First #3: Player takes index 2
// playerTakesIndex3First #4: Player takes index 5
// playerTakesIndex3First #5: Player takes index 6 (random AI moves will draw)
// playerTakesIndex3First #6: Player takes index 7
// playerTakesIndex3First #7: Player takes index 8

func playerTakesIndex3First() -> Bool {
    if moves[3]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[1]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        let combo: [Int] = [0, 2, 6]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[3]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[2]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        let combo: [Int] = [0, 6, 7]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[3]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[5]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        let combo: [Int] = [0, 2, 6, 8]
        let computerPosition = Int.random(in: 0..<4)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[3]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[7]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        let combo: [Int] = [0, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[3]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[8]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex6First #7
        let combo: [Int] = [0, 1, 6]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    return false
}

// playerTakesIndex5First: player takes index 5, AI takes index 4
// playerTakesIndex5First #1: Player takes index 2
// playerTakesIndex5First #2: Player takes index 1
// playerTakesIndex5First #3: Player takes index 0
// playerTakesIndex5First #4: Player takes index 3
// playerTakesIndex5First #5: Player takes index 6
// playerTakesIndexFirst #6: Player takes index 7
// playerTakesIndex5First #7: Player takes index 8

func playerTakesIndex5First() -> Bool {
    if moves[5]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[1]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        let combo: [Int] = [0, 2, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[5]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[0]?.indicator == "xmark" &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        let combo: [Int] = [2, 7, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[5]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[3]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        let combo: [Int] = [0, 2, 6, 8]
        let computerPosition = Int.random(in: 0..<4)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[5]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[6]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        let combo: [Int] = [1, 2, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[5]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[7]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        let combo: [Int] = [2, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    return false
}

// playerTakesIndex1First: player takes index 1, AI takes index 4
// playerTakesIndex1First #1: Player takes index 0 (random AI moves will draw)
// playerTakesIndex1First #3: Player takes index 2 (random AI moves will draw)
// playerTakesIndex1First #2: Player takes index 3
// playerTakesIndex1First #4: Player takes index 6
// playerTakesIndex1First #5: Player takes index 7
// playerTakesIndex1First #6: Player takes index 8
// playerTakesIndex1First #7: Player takes index 5

func playerTakesIndex1First() -> Bool {
    if moves[1]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[3]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        let combo: [Int] = [0, 2, 6]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[1]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[6]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        let combo: [Int] = [0, 2, 5]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[1]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[7]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        let combo: [Int] = [0, 2, 6, 8]
        let computerPosition = Int.random(in: 0..<4)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[1]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[8]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex6First #6
        let combo: [Int] = [0, 2, 3]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[1]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[5]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        let combo: [Int] = [0, 2, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    return false
}

// playerTakesIndex7First: player takes index 7, AI takes index 4
// playerTakesIndex7First #1: Player takes index 6 (random AI moves will draw)
// playerTakesIndex7First #2: Player takes index 8 (random AI moves will draw)
// playerTakesIndex7First #3: Player takes index 3
// playerTakesIndex7First #4: Player takes index 0
// playerTakesIndex7First #5: Player takes index 1
// playerTakesIndex7First #6: Player takes index 2
// playerTakesIndex7First #7: Player takes index 5

func playerTakesIndex7First() -> Bool {
    if moves[7]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[3]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        let combo: [Int] = [0, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[7]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[0]?.indicator == "xmark" &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        let combo: [Int] = [5, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[7]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[1]?.indicator == "xmark" &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #5
        let combo: [Int] = [0, 2, 6, 8]
        let computerPosition = Int.random(in: 0..<4)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[7]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[2]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        let combo: [Int] = [3, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    if moves[7]?.indicator == "xmark" && moves[4]?.indicator == "circle" && moves[5]?.indicator == "xmark" &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        let combo: [Int] = [2, 6, 8]
        let computerPosition = Int.random(in: 0..<3)
        moves[combo[computerPosition]] = Move(player: .computer, boardIndex: combo[computerPosition], checkIfOccupied: true)
        return true
    }
    return false
}

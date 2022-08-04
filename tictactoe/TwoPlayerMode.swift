////
////  TwoPlayerMode.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 7/31/22.
////
//
//import SwiftUI
//
//struct TwoPlayerMode: View {
//
//    let layout  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
////    @State private var isGameBoardDisabled = false
////    @State private var alertItem: AlertItem?
//    @State private var isHumanTurn = true
//
//    var body: some View {
//        GeometryReader  { geometry in
//            VStack{
//                Spacer()
//                LazyVGrid(columns: layout, spacing: 10) {
//                    ForEach(0..<9)  { i in
//
//                        ZStack  {
//                            RoundedRectangle(cornerRadius: 20)
//                                .foregroundColor(.blue)
//                                .frame(width: geometry.size.width/3 - 15,
//                                       height: geometry.size.width/3 - 15)
//                            Image(systemName: moves[i]?.indicator ?? "")
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                        }
//                        .onTapGesture {
//                            // user's move
////                            if moves[i]?.checkIfOccupied == true{
////                                return
////                            }
////                            else {
////                            moves[i] = Move(player: .human, boardIndex: i)
//                                moves[i] = Move(player: isHumanTurn ? .human : .computer, boardIndex: i)
//                                isHumanTurn.toggle()
//
//                                // check for human win
////                                if checkForWinHuman(in: moves) {
////                                    // draw winning line
////                                    alertItem = AlertContext.player1win
////                                    return
////                                }
////                                else if checkForDraw(in: moves){
////                                    alertItem = AlertContext.draw
////                                    return
////                                }
////                                isGameBoardDisabled = true
////                            }
//                        }
////                        .onTapGesture {
////                            if moves[i]?.checkIfOccupied == true{
////                                return
////                            }
////                            else {
////                            moves[i] = Move(player: .computer, boardIndex: i)
////
////                                // check for human win
////                                if checkForWinComputer(in: moves) {
////                                    // draw winning line
////                                    alertItem = AlertContext.player2win
////                                    return
////                                }
////                                else if checkForDraw(in: moves){
////                                    alertItem = AlertContext.draw
////                                    return
////                                }
////                                isGameBoardDisabled = false
////                            }
////                        }
//
//                    }
//                }
//                Spacer()
//            }
////            .disabled(isGameBoardDisabled)
//            .padding()
////            .alert(item: $alertItem, content: {alertItem in
////                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {resetGame()}))
////            })
//        }
//    }
//}
//
//struct TwoPlayerMode_Previews: PreviewProvider {
//    static var previews: some View {
//        TwoPlayerMode()
//    }
//}

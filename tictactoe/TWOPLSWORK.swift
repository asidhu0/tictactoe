////
////  TWOPLSWORK.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 8/1/22.
////
//
//import SwiftUI
//
//struct TWOPLSWORK: View {
//    let layout  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
//    @State private var isHumanTurn = true
//    @State private var alertItem: AlertItem?
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
////                            if moves[i]?.checkIfOccupied == true{
////                                return
////                            }
//                            if (moves[i] != nil) {
//                                return
//                            }
//                            moves[i] = Move(player: isHumanTurn ? .human : .computer, boardIndex: i)
//                            isHumanTurn.toggle()
////                             check for player1 win
//                                if checkForWinHuman(in: moves) {
//                                    // draw winning line
//                                    alertItem = AlertContext.player1win
//                                    return
//                                }
//                                else if checkForDraw(in: moves){
//                                    alertItem = AlertContext.draw
//                                    return
//                                }
//                        }
//                        .onTapGesture {
//                            moves[i] = Move(player: isHumanTurn ? .human : .computer, boardIndex: i)
//                            isHumanTurn.toggle()
////                             check for player1 win
//                            if checkForWinComputer(in: moves) {
//                                // draw winning line
//                                alertItem = AlertContext.player2win
//                                return
//                            }
//                            else if checkForDraw(in: moves){
//                                alertItem = AlertContext.draw
//                                return
//                            }
//                        }
//                    }
//                }
//                Spacer()
//            }
//            .padding()
//            .alert(item: $alertItem, content: {alertItem in
//                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {resetGame()}))
//                        })
//        }
//    }
//}
//
//struct TWOPLSWORK_Previews: PreviewProvider {
//    static var previews: some View {
//        TWOPLSWORK()
//    }
//}

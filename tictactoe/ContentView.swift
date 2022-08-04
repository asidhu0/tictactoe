////
////  Two.swift
////  tictactoe
////
////  Created by Avnoor Singh Sidhu on 7/31/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    let layout  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    @State private var isHumansTurn = true
////    @State private var moves: [Move?] = Array(repeating: nil , count: 9)
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
//                            moves[i] = Move(player: isHumansTurn ? .human : .computer, boardIndex: i)
//                            isHumansTurn.toggle()
//                        }
//                    }
//                }
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

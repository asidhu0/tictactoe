//
//  OptionsTwoPlayers.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/6/22.
//

import SwiftUI

struct OptionsTwoPlayers: View {
    @Binding var score: scores
    @Binding var sound: Bool
    @State var textFieldText1: String = ""
    @State var textFieldText2: String = ""
    @State var turnPicker: Bool
    @State private var pickedX: Bool = false
    @State private var pickedO: Bool = false
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)
    @State var colorButtonClickedO: [Bool] = Array(repeating: false, count: 10)
    @State var colorButtonClickedX: [Bool] = Array(repeating: false, count: 10)
    @State var color0: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @State var colorX: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @State var isShowingO: Bool = false
    @State var isShowingX: Bool = false
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                        .frame(width: 280, height: 120)
                    Text("Pick who goes first")
                        .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                        .foregroundColor(.cyan)
                        .padding()
                }
                HStack {
                    Spacer()
                    Button {
                        turnPicker = true
                        pickedX = true
                        pickedO = false
                        isShowingX = true
                    } label: {
                        ZStack {
                            if pickedX {
                                Capsule()
                                    .frame(width: 70, height: 6)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6344175935, green: 0.4580050707, blue: 0.8420854211, alpha: 1)))
                                    .offset(y: 40)
                            }
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(colorX)
                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                        }
                    }
                    Spacer()
                    Button {
                        turnPicker = false
                        pickedX = false
                        pickedO = true
                        isShowingO = true
                    } label: {
                        ZStack {
                            if pickedO {
                                Capsule()
                                    .frame(width: 70, height: 6)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6344175935, green: 0.4580050707, blue: 0.8420854211, alpha: 1)))
                                    .offset(y: 40)
                            }
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(color0)
                                .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
                        }
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                        .frame(width: 290, height: 80)
                    Text("Change Name")
                        .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                        .foregroundColor(.cyan)
                        .padding()
                }
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorX)
                        .padding(.leading, nil)
                    TextField("Player 1", text: $textFieldText1)
                        .overlay(
                            VStack{
                                Divider()
                                    .overlay(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                    .offset(x: 0, y: 15)
                            }
                        )
                        .padding()
                        .accentColor(.blue)
                        .padding(.trailing, nil)
                        .font(.custom("Castle-Rock", size: 25, relativeTo: .largeTitle))
                        .foregroundColor(Color.gray)
                }
                HStack {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(color0)
                        .padding(.leading, nil)
                    TextField("Player 2", text: $textFieldText2)
                        .overlay(
                            VStack{
                                Divider()
                                    .overlay(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                    .offset(x: 0, y: 15)
                            }
                        )
                        .padding()
                        .accentColor(.blue)
                        .padding(.trailing, nil)
                        .font(.custom("Castle-Rock", size: 25, relativeTo: .largeTitle))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: textFieldText1, player2Name: textFieldText2, color0: color0, colorX: colorX, twoPlayerTurnDecider: turnPicker, twoPlayerTurnDeciderForResetFunc: turnPicker)) {
                    Text("Continue")
                        .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                        .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                }
                Spacer()
            }
            colorCombinationPicker
        }
        .navigationTitle("")
    }
    
    var colorCombinationPicker: some View {
        ZStack(alignment: .bottom) {
            if isShowingO {
                Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowingO = false
                }
                showColors
                .transition(.move(edge: .bottom))
            }
            if isShowingX {
                Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowingX = false
                }
                showColors
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
        
    var showColors: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 6)
                .padding(.top, nil)
            Text("Pick a Color Combination")
                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                .padding(.top, nil)
            Spacer()
            VStack {
                Spacer()
                Button {
                    colorX = Color.blue
                    color0 = Color.blue
                    colorButtonClickedO = Array(repeating: false, count: 3)
                    colorButtonClickedO[0] = true
                } label: {
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 70, height: 70)
                            Image(systemName: "circle")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 70, height: 70)
                        }
                        if colorButtonClickedO[0] == true {
                              Capsule()
                                  .frame(width: 150, height: 4)
                                  .foregroundColor(Color.black)
                          }
                    }
                }
                Spacer()
                Button {
                    colorX = Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1))
                    color0 = Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1))
                    colorButtonClickedO = Array(repeating: false, count: 3)
                    colorButtonClickedO[1] = true
                } label: {
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                .frame(width: 70, height: 70)
                            Image(systemName: "circle")
                                .resizable()
                                .foregroundColor(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                .frame(width: 70, height: 70)
                        }
                        if colorButtonClickedO[1] == true {
                              Capsule()
                                  .frame(width: 150, height: 4)
                                  .foregroundColor(Color.black)
                          }
                    }
                }
                Spacer()
                Button {
                    colorX = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
                    color0 = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
                    colorButtonClickedO = Array(repeating: false, count: 3)
                    colorButtonClickedO[2] = true
                } label: {
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                .frame(width: 70, height: 70)
                            Image(systemName: "circle")
                                .resizable()
                                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                .frame(width: 70, height: 70)
                        }
                        if colorButtonClickedO[2] == true {
                              Capsule()
                                  .frame(width: 150, height: 4)
                                  .foregroundColor(Color.black)
                          }
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
    }
}
//
//struct OptionsTwoPlayers_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsTwoPlayers()
//    }
//}

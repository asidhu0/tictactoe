//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI
import CoreMedia

struct OptionsOnePlayer: View {
    @Binding var score: scores
    @Binding var sound: Bool
    @Binding var numPlayers: Int
    @State var textFieldText1: String = ""
    @State var pieceType: String = ""
    @State var modeOfDifficulty: String = ""
    @State var xORo: Bool = true
    @State var clickedX: Bool = false
    @State var clickedO: Bool = false
    @State var isShowing: Bool = false
    @State var color0: Color = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
    @State var colorX: Color = Color.blue
    @State var colorButtonClickedO: [Bool] = Array(repeating: false, count: 3)
    @State var offset: CGFloat = 0
    let background = LinearGradient(colors: [Color(#colorLiteral(red: 0.955021441, green: 0.7766728401, blue: 0.6494518518, alpha: 1)), Color(#colorLiteral(red: 0.9614726901, green: 0.8826437593, blue: 0.651904881, alpha: 1))], startPoint: .top, endPoint: .bottom)

    var body: some View {
        ZStack {
            background
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                            .frame(width: 340, height: 80)
                        Text("Select Difficulty")
                            .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                            .foregroundColor(.cyan)
                    }
                    
                    // Custom Slider
                    VStack {
                        Text(returnDiffLevel())
                            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                            .foregroundStyle(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                            .padding(.top, nil)
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Capsule()
                                .fill(Color.black.opacity(0.15))
                                .frame(height: 30)
                            
                            Capsule()
                                .fill(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                .frame(width: offset + 20, height: 33)
                            
                            // DOTS
                            HStack(spacing: (UIScreen.main.bounds.width - 100) / 17) {
                                ForEach(0..<17, id: \.self) {index in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            
                            Circle()
                                .fill(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                .frame(width: 35, height: 35)
                                .background(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 5)
                                )
                                .offset(x: offset)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        offset = value.location.x - 20
                                    }
                                }))
                        }
                        .padding(.leading, nil)
                        .padding(.trailing, nil)
                    }
                }
                Spacer()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                            .frame(width: 250, height: 75)
                        Text("Pick a Side")
                            .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                            .foregroundColor(.cyan)
                    }
                    .padding(.bottom, nil)
                    HStack {
                        Spacer()
                        Button  {
                            clickedX = true
                            clickedO = false
                            xORo = true
                            isShowing = true
                            pieceType = "xmark"
                            score.computerScoreEasy = 0
                            score.computerScoreMedium = 0
                            score.computerScoreHard = 0
                            score.computerScoreImpossible = 0
                            score.playerScoreEasy = 0
                            score.playerScoreMedium = 0
                            score.playerScoreHard = 0
                            score.playerScoreImpossible = 0
                        } label: {
                            ZStack {
                                if clickedX {
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
                            clickedO = true
                            clickedX = false
                            xORo = false
                            isShowing = true
                            pieceType = "circle"
                            score.computerScoreEasy = 0
                            score.computerScoreMedium = 0
                            score.computerScoreHard = 0
                            score.computerScoreImpossible = 0
                            score.playerScoreEasy = 0
                            score.playerScoreMedium = 0
                            score.playerScoreHard = 0
                            score.playerScoreImpossible = 0
                        } label: {
                            ZStack {
                                if clickedO {
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
                }
                Spacer()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                            .frame(width: 290, height: 75)
                        Text("Change Name")
                            .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                            .foregroundColor(.cyan)
                    }
                    VStack {
                        HStack {
                            ZStack {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, nil)
                                .opacity(0)
                            
                                if clickedX {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(colorX)
                                        .padding(.leading, nil)
                                }
                                else if clickedO {
                                    Image(systemName: "circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(color0)
                                        .padding(.leading, nil)
                                }
                            }
                        TextField("Player", text: $textFieldText1)
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
                        NavigationLink(destination: GameBoard(score: $score, sound: $sound, modeOfDifficulty: modeOfDifficulty, onePlayerPieceDecider: xORo, player1Name: textFieldText1, player2Name: pieceType, color0: color0, colorX: colorX, twoPlayerTurnDecider: true, twoPlayerTurnDeciderForResetFunc: true)) {
                            Text("Continue")
                                .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
                                .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                        }
                        .simultaneousGesture(TapGesture().onEnded({ _ in
                            modeOfDifficulty = returnDiffLevel()
                        }))
                    }
                }
                Spacer()
            }
            colorCombinationPicker
        }
        .navigationTitle("")
    }
    
    var colorCombinationPicker: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                     isShowing = false
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
                        colorX = Color.red
                        color0 = Color.orange
                        colorButtonClickedO = Array(repeating: false, count: 3)
                        colorButtonClickedO[0] = true
                    } label: {
                        VStack {
                            HStack {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 70, height: 70)
                                Image(systemName: "circle")
                                    .resizable()
                                    .foregroundColor(.orange)
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
                        colorX = .yellow
                        color0 = .green
                        colorButtonClickedO = Array(repeating: false, count: 3)
                        colorButtonClickedO[1] = true
                    } label: {
                        VStack {
                            HStack {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 70, height: 70)
                                Image(systemName: "circle")
                                    .resizable()
                                    .foregroundColor(.green)
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
                        colorX = .blue
                        color0 = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
                        colorButtonClickedO = Array(repeating: false, count: 3)
                        colorButtonClickedO[2] = true
                    } label: {
                        VStack {
                            HStack {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .foregroundColor(.blue)
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
    
    func returnDiffLevel() -> String {
        let percent = offset / UIScreen.main.bounds.width - 70
        if percent >= -70 && percent <= -69.81 {
            return "Easy"
        }
        else if percent > -69.81 && percent <= -69.59 {
            return "Medium"
        }
        else if percent > -69.59 && percent <= -69.37 {
            return "Hard"
        }
        return "Impossible"
    }
}

//struct OptionsOnePlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsOnePlayer(score: .constant(scores), sound: .constant(true), numPlayers: .constant(1))
//    }
//}


//
//  OptionsTwoPlayers.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/6/22.
//

import SwiftUI

struct OptionsTwoPlayers: View {
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @StateObject var viewModel = TwoPlayerOptionsViewModel()
    var body: some View {
        ZStack {
            viewModel.background
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                PickWhoGoesFirstView()
                HStack {
                    Spacer()
                    Button {
                        viewModel.processXmarkClick2()
                    } label: {
                        ZStack {
                            if viewModel.pickedX {
                                UnderlineSelectedPiece2()
                            }
                            XmarkButton(twoPlayerOptionsViewModel: viewModel)
                        }
                    }
                    Spacer()
                    Button {
                        viewModel.processCircleClick2()
                    } label: {
                        ZStack {
                            if !viewModel.pickedX {
                                UnderlineSelectedPiece2()
                            }
                            CircleButton(twoPlayerOptionsViewModel: viewModel)
                        }
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                ChangeNameView()
                HStack {
                    XmarkIndicatorTextField(twoPlayerOptionsViewModel: viewModel)
                    TextFieldView2(twoPlayerOptionsViewModel: viewModel, playerNum: 1)
                }
                HStack {
                    CircleIndicatorTextField(twoPlayerOptionsViewModel: viewModel)
                    TextFieldView2(twoPlayerOptionsViewModel: viewModel, playerNum: 2)
                }
                Spacer()
                NavigationLink(destination: GameScreen(mainMenuViewModel: mainMenuViewModel, modeOfDifficulty: "twoplayer", onePlayerPieceDecider: true, player1Name: viewModel.textFieldText1, player2Name: viewModel.textFieldText2, color0: viewModel.color0, colorX: viewModel.colorX, twoPlayerTurnDecider: viewModel.pickedX, twoPlayerTurnDeciderForResetFunc: viewModel.pickedX)) {
                    Continue()
                }
                Spacer()
            }
            ColorPickerPopup2(twoPlayerOptionsViewModel: viewModel)
        }
        .navigationTitle("")
    }
}

struct ColorPickerPopup2: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            if twoPlayerOptionsViewModel.isShowingColorPopup {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        twoPlayerOptionsViewModel.animatePopUp2()
                    }
                ColorSelectorView2(twoPlayerOptionsViewModel: twoPlayerOptionsViewModel)
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct PickWhoGoesFirstView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 280, height: 120)
            Text("Pick who goes first")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
                .padding()
        }
    }
}

struct UnderlineSelectedPiece2: View {
    var body: some View {
        Capsule()
            .frame(width: 70, height: 6)
            .foregroundColor(Color(#colorLiteral(red: 0.6344175935, green: 0.4580050707, blue: 0.8420854211, alpha: 1)))
            .offset(y: 40)
    }
}

struct XmarkButton: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(twoPlayerOptionsViewModel.colorX)
            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
    }
}

struct CircleButton: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(twoPlayerOptionsViewModel.color0)
            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
    }
}

struct ChangeNameView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 290, height: 80)
            Text("Change Name")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
                .padding()
        }
    }
}

struct XmarkIndicatorTextField: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(twoPlayerOptionsViewModel.colorX)
            .padding(.leading, nil)
    }
}

struct TextFieldView2: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var playerNum: Int
    var body: some View {
        TextField("Player \(playerNum)", text: playerNum == 1 ? $twoPlayerOptionsViewModel.textFieldText1 : $twoPlayerOptionsViewModel.textFieldText2)
            .overlay(
                TextFieldLineView2()
            )
            .padding()
            .accentColor(.blue)
            .padding(.trailing, nil)
            .font(.custom("Castle-Rock", size: 25, relativeTo: .largeTitle))
            .foregroundColor(Color.gray)
    }
}

struct TextFieldLineView2: View {
    var body: some View {
        VStack{
            Divider()
                .overlay(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                .offset(x: 0, y: 15)
        }
    }
}

struct CircleIndicatorTextField: View {
    @ObservedObject var twoPlayerOptionsViewModel: TwoPlayerOptionsViewModel
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(twoPlayerOptionsViewModel.color0)
            .padding(.leading, nil)
    }
}

struct Continue: View {
    var body: some View {
        Text("Continue")
            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
            .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
    }
}


struct OptionsTwoPlayers_Previews: PreviewProvider {
    static var previews: some View {
        OptionsTwoPlayers(mainMenuViewModel: MainMenuViewModel())
    }
}

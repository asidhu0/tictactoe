//
//  SelectDifficulty.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/31/22.
//

import SwiftUI
import CoreMedia

struct OnePlayerOptionsView: View {
    
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @StateObject var viewModel = OnePlayerOptionsViewModel()
    
    var body: some View {
        ZStack {
            viewModel.background
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    SelectDifficultySubtitleView()
                    Slider(optionsOnePlayerViewModel: viewModel)
                }
                Spacer()
                VStack {
                    PickASideSubtitleView()
                    HStack {
                        Spacer()
                        Button  {
                            viewModel.processXmarkClick()
                        } label: {
                            ZStack {
                                if viewModel.clickedX {
                                    UnderlineSelectedPiece()
                                }
                                XmarkButtonView(optionsOnePlayerViewModel: viewModel)
                            }
                        }
                        Spacer()
                        Button {
                            viewModel.processCircleClick()
                        } label: {
                            ZStack {
                                if !viewModel.clickedX {
                                    UnderlineSelectedPiece()
                                }
                                CircleButtonView(optionsOnePlayerViewModel: viewModel)
                            }
                        }
                        Spacer()
                    }
                }
                Spacer()
                VStack {
                    ChangeNameSubtitleView()
                    VStack {
                        HStack {
                            ZStack {
                                if viewModel.clickedX {
                                    XmarkTextField(optionsOnePlayerViewModel: viewModel)
                                }
                                else {
                                    CircleTextField(optionsOnePlayerViewModel: viewModel)
                                }
                            }
                            TextFieldView(optionsOnePlayerViewModel: viewModel)
                        }
                        NavigationLink(destination: GameScreen(mainMenuViewModel: mainMenuViewModel, modeOfDifficulty: viewModel.returnDiffLevel(), onePlayerPieceDecider: viewModel.clickedX, player1Name: viewModel.textFieldText, player2Name: viewModel.pieceType, color0: viewModel.color0, colorX: viewModel.colorX, twoPlayerTurnDecider: true, twoPlayerTurnDeciderForResetFunc: true)) {
                            ContinueView()
                        }
                    }
                }
                Spacer()
            }
            ColorPickerPopup(onePlayerOptionsViewModel: viewModel)
        }
        .navigationTitle("")
    }
}

struct SelectDifficultySubtitleView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 340, height: 80)
            Text("Select Difficulty")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
        }
    }
}

struct PickASideSubtitleView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 250, height: 75)
            Text("Pick a Side")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
        }
        .padding(.bottom, nil)
    }
}

struct ChangeNameSubtitleView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
                .frame(width: 290, height: 75)
            Text("Change Name")
                .font(.custom("Castle-Rock", size: 50, relativeTo: .largeTitle))
                .foregroundColor(.cyan)
        }
    }
}


struct UnderlineSelectedPiece: View {
    var body: some View {
        Capsule()
            .frame(width: 70, height: 6)
            .foregroundColor(Color(#colorLiteral(red: 0.6344175935, green: 0.4580050707, blue: 0.8420854211, alpha: 1)))
            .offset(y: 40)
    }
}

struct TextfieldLineView: View {
    var body: some View {
        VStack {
            Divider()
                .overlay(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                .offset(x: 0, y: 15)
        }
    }
}

struct Slider: View {
    
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    
    var body: some View {
        VStack {
            
            DifficultyLevelText
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                BeforeSlidingCapsule

                AfterSlidingCapsule
                
                Dots
                
                SlidingCircle
            }
            .padding(.leading, nil)
            .padding(.trailing, nil)
        }
    }
    
    var DifficultyLevelText: some View {
        Text(optionsOnePlayerViewModel.returnDiffLevel())
            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
            .foregroundStyle(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
            .padding(.top, nil)
    }
    
    var BeforeSlidingCapsule: some View {
        Capsule()
            .fill(Color.black.opacity(0.15))
            .frame(height: 30)
    }
    
    var AfterSlidingCapsule: some View {
        Capsule()
            .fill(Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
            .frame(width: optionsOnePlayerViewModel.offset + 20, height: 33)
    }
    
    var Dots: some View {
        HStack(spacing: (UIScreen.main.bounds.width - 100) / 17) {
            ForEach(0..<17, id: \.self) {index in
                Circle()
                    .fill(Color.white)
                    .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
            }
        }
    }
    
    var SlidingCircle: some View {
        Circle()
            .fill(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
            .frame(width: 35, height: 35)
            .background(
                Circle()
                    .stroke(Color.white, lineWidth: 5)
            )
            .offset(x: optionsOnePlayerViewModel.offset)
            .gesture(
                DragGesture().onChanged({ (value) in
                    optionsOnePlayerViewModel.processSliderDrag(value: value)
                })
            )
    }
}

struct XmarkButtonView: View {
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(optionsOnePlayerViewModel.colorX)
            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
    }
}

struct CircleButtonView: View {
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(optionsOnePlayerViewModel.color0)
            .shadow(color: Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.16), radius: 5, x: 5, y: 5)
    }
}

struct XmarkTextField: View {
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(optionsOnePlayerViewModel.colorX)
            .padding(.leading, nil)
    }
}

struct CircleTextField: View {
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(optionsOnePlayerViewModel.color0)
            .padding(.leading, nil)
    }
}

struct TextFieldView: View {
    @ObservedObject var optionsOnePlayerViewModel: OnePlayerOptionsViewModel
    var body: some View {
        TextField("Player", text: $optionsOnePlayerViewModel.textFieldText)
            .overlay(
                TextfieldLineView()
            )
            .padding()
            .accentColor(.blue)
            .padding(.trailing, nil)
            .font(.custom("Castle-Rock", size: 25, relativeTo: .largeTitle))
            .foregroundColor(Color.gray)
    }
}

struct ContinueView: View {
    var body: some View {
        Text("Continue")
            .font(.custom("Castle-Rock", size: 30, relativeTo: .largeTitle))
            .foregroundColor(Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
    }
}

struct ColorPickerPopup: View {
    @ObservedObject var onePlayerOptionsViewModel: OnePlayerOptionsViewModel
    @State var currentDragOffset: CGFloat = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            if onePlayerOptionsViewModel.isShowingColorPopup {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        onePlayerOptionsViewModel.animatePopUp()
                    }
                ColorSelectorView(onePlayerOptionsViewModel: onePlayerOptionsViewModel)
                    .transition(.move(edge: .bottom))
                    .offset(y: currentDragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.easeInOut) {
                                    if currentDragOffset < 0 {
                                        return
                                    }
                                    else {
                                        currentDragOffset = value.translation.height
                                    }
                                }
                            }
                            .onEnded { value in
                                withAnimation(.easeInOut) {
                                    if currentDragOffset < 0 {
                                        currentDragOffset = 0
                                    }
                                    else {
                                        currentDragOffset = 0
                                        onePlayerOptionsViewModel.isShowingColorPopup = false
                                    }
                                }
                            }
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct OptionsOnePlayer_Previews: PreviewProvider {
    static var previews: some View {
        OnePlayerOptionsView(mainMenuViewModel: MainMenuViewModel())
    }
}

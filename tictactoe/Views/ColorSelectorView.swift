//
//  ColorSelector.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/21/22.
//

import SwiftUI

struct ColorSelectorView: View {
    @ObservedObject var onePlayerOptionsViewModel: OnePlayerOptionsViewModel
    @State var colorButtonClicked: [Bool] = Array(repeating: false, count: 3)
    var body: some View {
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
                        onePlayerOptionsViewModel.colorX = Color.blue
                        onePlayerOptionsViewModel.color0 = Color.blue
                        colorButtonClicked = Array(repeating: false, count: 3)
                        colorButtonClicked[0] = true
                    } label: {
                        VStack {
                            HStack {
                                XmarkView(color: .blue)
                                CircleView(color: .blue)
                            }
                            if colorButtonClicked[0] == true {
                                UnderlineSelectedColor()
                              }
                        }
                    }
                    Spacer()
                    Button {
                        onePlayerOptionsViewModel.colorX = Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1))
                        onePlayerOptionsViewModel.color0 = Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1))
                        colorButtonClicked = Array(repeating: false, count: 3)
                        colorButtonClicked[1] = true
                    } label: {
                        VStack {
                            HStack {
                                XmarkView(color: Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                                CircleView(color: Color(#colorLiteral(red: 0.9295205474, green: 0.5919809937, blue: 0.7504517436, alpha: 1)))
                            }
                            if colorButtonClicked[1] == true {
                                UnderlineSelectedColor()
                              }
                        }
                    }
                    Spacer()
                    Button {
                        onePlayerOptionsViewModel.colorX = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
                        onePlayerOptionsViewModel.color0 = Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1))
                        colorButtonClicked = Array(repeating: false, count: 3)
                        colorButtonClicked[2] = true
                    } label: {
                        VStack {
                            HStack {
                                XmarkView(color: Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                                CircleView(color: Color(#colorLiteral(red: 0.6145727634, green: 0.4697432518, blue: 0.8619191647, alpha: 1)))
                            }
                            if colorButtonClicked[2] == true {
                                UnderlineSelectedColor()
                              }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.maxY * 0.53)
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.9647727609, green: 0.9452378154, blue: 0.8428220749, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct XmarkView: View {
    var color: Color
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .foregroundColor(color)
            .frame(width: 70, height: 70)
    }
}

struct CircleView: View {
    var color: Color
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .foregroundColor(color)
            .frame(width: 70, height: 70)
    }
}

struct UnderlineSelectedColor: View {
    var body: some View {
        Capsule()
            .frame(width: 150, height: 4)
            .foregroundColor(Color.black)
    }
}

struct ColorSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectorView(onePlayerOptionsViewModel: OnePlayerOptionsViewModel())
    }
}

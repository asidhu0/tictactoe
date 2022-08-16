//
//  ModalView.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 8/10/22.
//

import SwiftUI

struct ModalView: View {
    @State var isShowing: Bool = false
    var body: some View {
        ZStack {
            
            Button {
                isShowing = true
            } label: {
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100)
            }
            
            
            ZStack(alignment: .bottom) {
                if isShowing {
                    Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                         isShowing = false
                    }
                    mainView
                    .transition(.move(edge: .bottom))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.easeInOut)
        }
    }
    
    var mainView: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 6)
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.brown)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.cyan)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width: 40, height: 40)
            }
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.pink)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.orange)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.purple)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 40, height: 40)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 40, height: 40)
            }
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
    
//    var mainView: some View {
//        VStack {
//            ZStack {
//                Capsule()
//                    .frame(width: 40, height: 6)
//            }
//            .frame(height: 40)
//            .frame(maxWidth: .infinity)
//            .background(Color.white.opacity(0.00001))
//        }
//        .frame(height: 400)
//        .frame(maxWidth: .infinity)
//        .background(Color.white)
//    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
//        ModalView(isShowing: .constant(true) )
        ModalView()
//        test2()
    }
}

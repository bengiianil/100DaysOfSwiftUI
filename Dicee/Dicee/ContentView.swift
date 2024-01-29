//
//  ContentView.swift
//  Dicee
//
//  Created by Bengi Anıl on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber: Int = 1
    @State var rightDiceNumber: Int = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)

                Spacer()
                Button {
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .frame(height: 100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

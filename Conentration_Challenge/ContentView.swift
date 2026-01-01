//
//  ContentView.swift
//  Conentration_Challenge
//
//  Created by app-kaihatsusha on 01/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalGuesses = 0
    @State private var gameMessage = ""
    @State private var tiles = ["🚀","🍕"]
    @State private var emojiShowing = Array(repeating: false, count: 4)
    @State private var guesses: [Int] = []
    
    @State private var matchFound = false
    @State private var allDisabled = false
    
    let tileBack = "⚪️"
    
//    private let emoji: [String] = ["🚀","🍕","🦅","🦄","🌮","🐢","🦋","🌶️"]
//    private var emojiArray: [[String]] = [["🚀","🍕","🦅","🦄"], ["🌮","🐢","🦋","🌶️"], ["🚀","🍕","🦅","🦄"], ["🌮","🐢","🦋","🌶️"]]
    
    var body: some View {
        VStack {
            Text("Total Guesses: \(totalGuesses)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            HStack {
                Button(emojiShowing[0] == false ? tileBack : tiles[0]) {
                    buttonTapped(index: 0)
                    
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                .disabled(allDisabled)
                
                Button(emojiShowing[1] == false ? tileBack : tiles[1]) {
                    buttonTapped(index: 1)
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                .disabled(allDisabled)
                
                Button(emojiShowing[2] == false ? tileBack : tiles[2]) {
                    buttonTapped(index: 2)
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                .disabled(allDisabled)
                
                Button(emojiShowing[3] == false ? tileBack : tiles[3]) {
                    buttonTapped(index: 3)
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                .disabled(allDisabled)
            }
            
            Text(gameMessage)
                .font(.largeTitle)
                .frame(height: 80)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            if allDisabled {
                Button("Another Try?") {
                    // TODO: function to reset game
                    allDisabled.toggle()
                    if !matchFound {
                        emojiShowing[guesses[0]] = false
                        emojiShowing[guesses[1]] = false
                    }
                    guesses = []
                    gameMessage = ""
                    
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(matchFound ? .mint : .red)
                .clipShape(Capsule())
            }
            // TODO: Winner 'You Guessed Them All!'
            
            
            
        }
        .padding()
        .onAppear {
            tiles = tiles + tiles
            tiles.shuffle()
            print(tiles.joined(separator: ", "))
            
        }
    }
    
    
    func buttonTapped(index: Int) {
        if !emojiShowing[index] {
            emojiShowing[index] = true
            totalGuesses += 1
            guesses.append(index)
            
//            print("guesses: \(guesses)")
//            print("emojisShowing: \(emojiShowing)")
            
            // Check if this is second guess
            if guesses.count > 1 {
                // Disable all tiles/buttons
                allDisabled = true
                // Show another try button
                checkForMatch()
            }
        }
    }
    
    func checkForMatch() {
        if tiles[guesses[0]] == tiles[guesses[1]] {
            gameMessage = "✅ You Found a Match!"
            matchFound = true
            
        } else {
            gameMessage = "❌ Not a Match. Try Again."
        }
    }
    
}

#Preview {
    ContentView()
}

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
    @State private var gameMessage = "You Guessed Them All!"
    @State private var tiles = ["🚀","🍕"]
    
    let tileBack = "⚪️"
    
    private let emoji: [String] = ["🚀","🍕","🦅","🦄","🌮","🐢","🦋","🌶️"]
    private var emojiArray: [[String]] = [["🚀","🍕","🦅","🦄"], ["🌮","🐢","🦋","🌶️"], ["🚀","🍕","🦅","🦄"], ["🌮","🐢","🦋","🌶️"]]
    @State private var showFirst = false
    
    var body: some View {
        VStack {
            Text("Total Guesses: \(totalGuesses)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            HStack {
                Button(tileBack) {
                    //TODO: Action
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                
                Button(tileBack) {
                    //TODO: Action
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                
                Button(tileBack) {
                    //TODO: Action
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                
                Button(tileBack) {
                    //TODO: Action
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
            }
            
            Text(gameMessage)
                .font(.largeTitle)
                .frame(height: 80)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            Button("Another Try?") {
                // TODO: function to reset game
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .clipShape(Capsule())
            
            
            
        }
        .padding()
        .onAppear {
            tiles = tiles + tiles
            tiles.shuffle()
            print(tiles.joined(separator: ", "))
            
        }
    }
    
    func updateGame() {
        
    }
    
    func setupGame() {
        
    }
    
    
    func displayGuessMessage() {
        
        
    }
    
    @ViewBuilder
    func createGrid() -> some View {
        VStack {
            buildRow(row: 0)
            buildRow(row: 1)
            buildRow(row: 2)
            buildRow(row: 3)
        }
    }
    
    @ViewBuilder
    func buildRow(row: Int) -> some View {
        HStack(spacing: 10.0) {
            getTile(row: row, column: 0)
            getTile(row: row, column: 1)
            getTile(row: row, column: 2)
            getTile(row: row, column: 3)
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func getTile(row: Int, column: Int) -> some View {
        ZStack {
//            Circle()
//                .foregroundStyle(.gray.gradient.opacity(0.2))
            
            Button {
                // TODO: Add Action
                print("Tapped: row: x:\(row) col: y:\(column)")
            } label: {
                ZStack {
                    Circle()
                        .inset(by: 20)
                        .foregroundStyle(LinearGradient(colors: [.white, .gray.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                    
                    Text("\(emojiArray[row][column])")//🚀
                }
                
            }
        }
        .frame(width: 80, height: 80)
    }
    
}

#Preview {
    ContentView()
}

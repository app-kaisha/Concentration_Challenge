//
//  ContentView.swift
//  Conentration_Challenge
//
//  Created by app-kaihatsusha on 01/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var totalGuesses = 0
    @State private var gameMessage = ""
    @State private var tiles = ["🚀","🍕"]
    @State private var emojiShowing = Array(repeating: false, count: 4)
    @State private var guesses: [Int] = []
    
    @State private var matchFound = false
    @State private var allDisabled = false
    @State private var gameOver = false
    
    @State private var audioPlayer: AVAudioPlayer!
    
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
            ZStack {
                if gameOver {
                    Button("Play Again?") {
                        allDisabled = false
                        guesses = []
                        gameMessage = ""
                        emojiShowing = Array(repeating: false, count: 4)
                        totalGuesses = 0
                        matchFound = false
                        gameOver = false
                        tiles.shuffle()
                        print(tiles.joined(separator: ", "))
                        
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .clipShape(Capsule())
                } else if allDisabled {
                    Button("Another Try?") {
                        
                        if !matchFound {
                            emojiShowing[guesses[0]] = false
                            emojiShowing[guesses[1]] = false
                        }
                        allDisabled = false
                        guesses = []
                        gameMessage = ""
                        matchFound = false
                        
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(matchFound ? .mint : .red)
                    .clipShape(Capsule())
                }
            }
            .frame(height: 80)
            
            
            
        }
        .padding()
        .onAppear {
            tiles = tiles + tiles
            tiles.shuffle()
            print(tiles.joined(separator: ", "))
            
        }
    }
    
    
    func buttonTapped(index: Int) {
        
        // tile flipped sound
        playSound(soundName: "tile-flip")
        
        if !emojiShowing[index] {
            emojiShowing[index] = true
            totalGuesses += 1
            guesses.append(index)
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
            playSound(soundName: "correct")
            if !emojiShowing.contains(false) {
                // All cards shown
                gameOver = true
                gameMessage = "You Guessed Them All!"
                playSound(soundName: "ta-da")
            }
            
        } else {
            gameMessage = "❌ Not a Match. Try Again."
            playSound(soundName: "wrong")
        }
    }
    
    func playSound(soundName: String) {

        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }

    }
    
    
    
}

#Preview {
    ContentView()
}

//
//  Conentration_ChallengeApp.swift
//  Conentration_Challenge
//
//  Created by app-kaihatsusha on 01/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct Conentration_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // TODO: only for debug of launch screen - need to remove
                .onAppear {
                    Thread.sleep(forTimeInterval: 3.0)
                }
        }
    }
}

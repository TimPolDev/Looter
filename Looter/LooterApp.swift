//
//  LooterApp.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

@main
struct LooterApp: App {
    // Ici utiliser un @AppStorage pour stocker ce booléen entre les lancements de l'application
        var isOnboardingDone: Bool = true

        var body: some Scene {
            WindowGroup {
                if isOnboardingDone {
                    ContentView()
                } else {
                    // Onboarding
                }
            }
        }
}

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
    @AppStorage("isOnboarding") var isOnboarding : Bool = true

        var body: some Scene {
            WindowGroup {
                if isOnboarding == true  {
                    OnboardingView()
                } else {
                    ContentView()
                }
            }
        }
}

//
//  OnboardingView.swift
//  Looter
//
//  Created by Timote POLICET on 1/24/24.
//

import SwiftUI



struct OnboardingView: View {
    
    var body: some View {
        TabView{
            OnboardingPageView(title: "Gérer ses loots", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle", image: "epees-croisees")
            OnboardingPageView(title: "Votre wishlist", description: "Créez une liste de souhaits pour garder une trace des achats que vous souhaitez acquérir", image: "etoile-filante")
            OnboardingPageView(title: "En un coup d'oeil", description: "Accédez rapidement à vos fonctionnalités clé depuis l'écran d'accueil de votre appareil", image: "thunder-bolt", finish: true)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(.blue)
        
    }
}

#Preview {
    OnboardingView()
}

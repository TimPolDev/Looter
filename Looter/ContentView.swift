//
//  ContentView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

enum LooterFeature {
    case loot
    case wishList
    case profile
}
struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding:Bool?
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false
    
    @State private var selectedFeature: LooterFeature = .loot
    
    func reset(){
        isOnboarding = true
    }

    var body: some View {
        
        Button(action: reset, label: {
            Text("reset")
        })
            TabView(selection: $selectedFeature) {
                HomeView()
                    .tabItem {
                        Label("Loot", systemImage: "bag.fill")
                    }
                    .tag(LooterFeature.loot)
                WishListView()
                    .tabItem {
                        Label("Wishlist", systemImage: "heart.fill")
                    }
                    .tag(LooterFeature.wishList)
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person.fill")
                    }
                    .tag(LooterFeature.profile)
            }
        }
}

#Preview {
    ContentView()
}


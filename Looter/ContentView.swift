//
//  ContentView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var loot = ["Epée", "Bouclier", "Armure"]

    func addItem() {
        loot.append("Magie de feu")
    }

    var body: some View {
        List {
            Button(action: {
                addItem()
            }, label: {
                Text("Ajouter")
            })

            ForEach(loot, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ContentView()
}

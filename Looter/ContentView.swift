//
//  ContentView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = testData
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

func rarityColor(rarity: Rarity) -> Color {
        switch rarity {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink{
                            LootDetailView(item: item) // On passe directement l'item à la vue
                    }label:{
                        HStack{
                            Color(rarityColor(rarity: item.rarity))
                                .frame(width: 15, height: 15)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text(item.name)
                                if let attackStrength = item.attackStrength {
                                    Text("Puissance : \(String(attackStrength))")
                                }
                            }
                            Spacer()
                            Text(item.type.rawValue)
                            
                            
                            
                        }
                    }
                    
                    
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                    AddItemView()
                    .environmentObject(inventory)
                })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}

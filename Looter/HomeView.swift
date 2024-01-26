//
//  HomeView.swift
//  Looter
//
//  Created by Timote POLICET on 1/26/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = testData
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}




struct HomeView: View {
    
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false
    
    

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink{
                            LootDetailView(item: item) // On passe directement l'item à la vue
                    }label:{
                        ExtractedView(item: item)
                    }
                    
                    
                }.onDelete(perform: {indexSet in
                    inventory.loot.remove(atOffsets: indexSet)
                })
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
                .toolbar {
                                EditButton()
                            }
        }
    }
}
#Preview {
    HomeView()
}

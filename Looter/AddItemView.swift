//
//  AddItemView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI






struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var inventory :Inventory
    @State private var selectedName:String = ""
    @State private var selectedRarity = Rarity.common
    @State private var selectedQuantity = 1
    @State private var selectedType = Itemtype.magic
    @State private var selectedAttack = false
    @State private var counter = 0
    @State private var selectedAttackValue: Int? = nil
    @State private var selectedGame = Game.emptyGame
    
    
    var body: some View {
        
        Form {
            Section {
                TextField("Nom de l'objet", text: $selectedName)
                Picker("Rareté", selection: $selectedRarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity   in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $selectedGame) {
                    Text("\(Game.emptyGame.name)").tag(Game.emptyGame)
                    ForEach(availableGames) { game   in
                        Text(game.name).tag(game)
                    }
                }
                
                Stepper("Combien : \(selectedQuantity)", value: $selectedQuantity )
                
                
                
               
            }
            Section{
                HStack{
                    Text("Type")
                    Spacer()
                    Text("\(selectedType.rawValue)")
                }
                Picker("Type", selection: $selectedType) {
                    ForEach(Itemtype.allCases, id:\.self) { type in
                        Text(String(describing: type.rawValue).capitalized)
                    }
                }.pickerStyle(.palette)
            }
            
            Section {
                Toggle(isOn: $selectedAttack) {
                    Text("Item d'attaque ?")
                }

                if selectedAttack {
                    Stepper("Force d'attaque : \(selectedAttackValue ?? 0)", onIncrement: {
                        self.selectedAttackValue = (self.selectedAttackValue ?? 0) + 1
                    }, onDecrement: {
                        self.selectedAttackValue = max((self.selectedAttackValue ?? 0) - 1, 0)
                    })
                }
            }
            Section{
                Button(action: {
                    let newItem = LootItem(name: selectedName, type: selectedType, rarity: selectedRarity, attackStrength: selectedAttackValue, game: selectedGame)
                    inventory.addItem(item: newItem )
                    dismiss()
                
                }, label: {
                    Text("Ajouter l'objet")
                })
            }
        }
    }
}
#Preview {
    AddItemView()
}

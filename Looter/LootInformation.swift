//
//  LootInformation.swift
//  Looter
//
//  Created by Timote POLICET on 1/23/24.
//

import SwiftUI

struct LootInformation: View {
    let item:LootItem
    var body: some View {
        Section(header: Text("Informations")){
            HStack{
                
                if let coverName = item.game.coverName {
                    Image(coverName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame( height: 58)
                        .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                    
                    Text(item.game.name)
                    
                } else {
                    
                    Image(systemName: "rectangle.slash")
                        .padding(.horizontal, 7.0)
                        .frame(height: 58)
                        .background(Color.gray)
                        .cornerRadius(4.0)
                        .opacity(/*@START_MENU_TOKEN@*/0.4/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    
                    
                    Text(item.game.name)
                    
                }
                
                
                
                
            }
            Text("In-game : \(item.name)")
            if let attackStrength = item.attackStrength {
                Text("Puissance (ATQ) : \(attackStrength)")
            }
            else{
                Text("Puissance (ATQ) : Aucune")
            }
            
            Text("Possédé(s) : \(item.quantity)")
            Text("Rareté : \(rarityName(rarity: item.rarity))")
        }
    }
}



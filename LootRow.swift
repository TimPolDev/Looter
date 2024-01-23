//
//  LootRow.swift
//  Looter
//
//  Created by Timote POLICET on 1/23/24.
//

import SwiftUI


struct ExtractedView: View  {
    let item:LootItem
    var body: some View {
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


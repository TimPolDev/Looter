//
//  LootItem.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

enum Itemtype:String,CaseIterable {
    
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "🧪"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

enum Rarity:String, CaseIterable{
    case common 
    case uncommon
    case rare
    case epic
    case legendary
    case unique
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

func rarityName(rarity: Rarity) -> String {
        switch rarity {
        case .common:
            return "Common"
        case .uncommon:
            return "Uncommon"
        case .rare:
            return "Rare"
        case .epic:
            return "Epic"
        case .legendary:
            return "Legendary"
        case .unique:
            return "Unique"
        }
    }

struct LootItem:Identifiable{
    var id: UUID = UUID()
    var quantity:Int = 1
    var name:String
    var type:Itemtype
    var rarity: Rarity
    var attackStrength :Int?
    var game: Game
    var setPower:Bool = false
    
    
}


    let testData: [LootItem] = [
        LootItem(name: "Épée de Flamme", type: .fire, rarity: .rare, attackStrength: 10, game: availableGames[0]),
        LootItem(name: "Arc Glacial", type: .ice, rarity: .epic, attackStrength: 15, game: availableGames[1]),
        LootItem(name: "Bouclier de Terre", type: .shield, rarity: .common, attackStrength: 5, game: availableGames[2]),
        LootItem(name: "Dague de Poison", type: .poison, rarity: .uncommon, attackStrength: 8, game: availableGames[0]),
        LootItem(name: "Anneau de Foudre", type: .thunder, rarity: .legendary, attackStrength: 20, game: availableGames[4])
    ]



//
//  Game.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "Non spécifié", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring_cover"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim_cover"),
    Game(name: "WoW", genre: .mmorpg, coverName: "wow_cover"),
    Game(name: "CS:GO", genre: .fps, coverName: "csgo_cover"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diablo_cover")
]


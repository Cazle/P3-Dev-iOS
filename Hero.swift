//
//  Heroes.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

// Corriger Heros
class Hero{
    
    var weapons: String
    var healthPoints : Int
    var attack: Int
    
    init(weapons: String, healthPoints: Int, attack: Int) {
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.attack = attack
    }
    func attack(target: Hero){
        
    }
}

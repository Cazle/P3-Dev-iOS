//
//  Warrior.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

class Warrior: Heroes{
    
    init(){
        super .init(weapons: "Sword", healthPoints: 100, attack: 20)
    }
}

class Dwarf: Heroes{
    
    init(){
        super .init(weapons: "Axe", healthPoints: 60, attack: 40)
    }
}

//
//  Healer.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

class Healer: Heroes{
    
    var heal : Int
    
    init(heal: Int) {
        self.heal = heal
        super .init(weapons: "Book of Wisdom", healthPoints: 70, attack: 10)
    }
}
class Wizard: Heroes{
    
    init(){
        super .init(weapons: "Magic Wand", healthPoints: 80, attack: 25)
    }
}

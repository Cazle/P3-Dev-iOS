//
//  PlayerTwo.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

class PlayerTwo{
    
    var warrior = Warrior()
    var thief = Thief()
    var healer = Healer(heal: 20)
    var dwarf = Dwarf()
    var wizard = Wizard()
    
    init(warrior: Warrior = Warrior(), thief: Thief = Thief(), healer: Healer = Healer(heal: 20), dwarf: Dwarf = Dwarf(), wizard: Wizard = Wizard()) {
        self.warrior = warrior
        self.thief = thief
        self.healer = healer
        self.dwarf = dwarf
        self.wizard = wizard
    }
}

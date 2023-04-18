//
//  main.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

var theGameIsOn = true

class Game {
    
    func printHello(){
        print("Welcome to the new game of FrenchGame company !")
        
        if let startingTheGame = readLine(){
            print("Welcome \(startingTheGame)")
        }else{
            print("Veuillez répondre")
        }
        
    }
    
}
var game = Game()
game.printHello()

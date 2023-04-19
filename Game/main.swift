//
//  main.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

var theGameIsOn = true

class Game {
    
    func startingTheGame(){
        print("Welcome to the new game of FrenchGame company !")
        print("Type start to 'start' the game or quit to 'exit' the game.")
        
        var start = readLine()
        if start == "start"{
            print("You've started the game")
        }
        else{
            start = "exit"
            print("You've left the game")
        }
        
        var firstPlayer = PlayerOne()
        var arrayOfTeam = [String]()
    }
        
           
        
        
        
        
        
    }
}
var game = Game()
game.startingTheGame()


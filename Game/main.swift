//
//  main.swift
//  Game
//
//  Created by Kyllian GUILLOT on 16/04/2023.
//

import Foundation

var game = Game()

game.startingTheGame()


class Game {
    
    func startingTheGame(){
    print("Welcome to the new game of FrenchGame company !")
    print("""
     Please select one option.
     1 : Start game
     2 : Quit game
    """)
        let startMenu = readLine()
            
        switch startMenu{
            
        case "1" :
            let chooseTeam = GameSession()
            chooseTeam.makeATeam()
            
        case "2":
            print("Thanks for playing the game. Good bye !")
            exit(0)
            
        
        default:
            print("I didn't understood, please try again.")
        }
    }
}

class GameSession {
    
    
    func makeATeam(){
        print("Welcome, make a team please")
        
        
       
    }
    
}



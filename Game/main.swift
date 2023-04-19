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
    
    var playerOne = Player(name: "Player one")
    var playerTwo = Player(name: "Player two")
    
    
func makeATeam(){
    
    while playerOne.heroes.count <= 2{
        print("""
 Make a team.
 You have \(playerOne.heroes.count) heroes on 3
 1 : Warrior
 2 : Wizard
 3 : Thief
 4 : Dwarf
 5 : Healer
 """)
        let chooseHero = readLine()
        
        switch chooseHero{
                
        case "1": playerOne.heroes.append(Warrior())
            print("You chose Warrior.")
                
        case "2": playerOne.heroes.append(Wizard())
            print("You chose Wizard.")

        case "3": playerOne.heroes.append(Thief())
            print("You chose Thief.")
                
        case "4": playerOne.heroes.append(Dwarf())
            print("You chose Dwarf.")
            
        case "5":playerOne.heroes.append(Healer(heal: 20))
            print("You chose Healer.")
                
        default: print("You must select between 1 and 5.")
            }
        }
    }
}




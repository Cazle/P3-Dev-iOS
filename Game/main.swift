import Foundation
// "game" is for launching the game.
let game = Game()
game.startingTheGame()

class Game {
    
    // Main menu, with 2 options, one to start the game, the other to exit the game.
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
            chooseTeam.startGame()
            
            
        case "2":
            print("Thanks for playing the game. Good bye !")
            exit(0)
            
        default:
            print("I didn't understood, please try again.")
            startingTheGame()
        }
    }
}
class GameSession {
    
    // Declare two players with both name
    var playerOne = Player(name: "Player one")
    var playerTwo = Player(name: "Player two")
    
    // Variable to handle our two players
    var players: [Player] {
        return [playerOne, playerTwo]
    }
    
    var maxHeroesPerPlayer = 3
    
    func startGame(){
        print("The game is starting")
        startingComposingTeams(for: players)
    }
    // Launch the composition of each player
    func startingComposingTeams(for players: [Player]){
        for player in players {
            createHero(for: player)
            
            // If both players have made their team, we resume the team for each player, and prepare for the fight !
            if playerOne.characters.count == maxHeroesPerPlayer &&
                playerTwo.characters.count == maxHeroesPerPlayer{
                
                resumeOfTeams()
            }
        }
    }
    
    // Control if the name is unique and make sure that the player has written a name
    func askName() -> String{
        print("                                 ")
        print("Enter a name for your character :")
        print("                                 ")
        var name = ""
        let allCharacters = players.flatMap{currentCharacter in currentCharacter.characters}
        while name.isEmpty{
            if let newName = readLine(), !newName.isEmpty{
                var hasFoundADuplicate = false
                
                for character in allCharacters {
                    if character.name == newName{
                        hasFoundADuplicate = true
                        break
                    }
                }
                
                if !hasFoundADuplicate{
                    name = newName
                } else {
                    print("               ")
                    print("⚠️ This name is already taken. ⚠️")
                    print("                ")
                }
            }
            else{
                print("⚠️ You must write a name. ⚠️")
            }
        }
        return name
    }
    // Function to make sur that the player chose between one and five
    func askHero() -> Int{
        
        print("""
        1. Warrior ⚔️
        2. Dwarf ⛏️
        3. Thief 🥷
        4. Wizard 🧙‍♂️
        5. Healer 🧝🏼‍♂️
        """)
        let characterChoice = readLine()
        
        switch characterChoice{
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        default: print("You must choose between 1 and 5.")
        }
        return askHero()
    }
    
    // The player chose a hero between the 5 available
    func createHero(for player: Player){
        print("                                         ")
        print("\(player.name), you have to chose 3 heroes.")
        print("                                         ")
        
        while player.characters.count < maxHeroesPerPlayer{
            print("\(player.name), you've got \(player.characters.count + 1) on 3")
            
            
            let askingHero = askHero()
            let askingName = askName()
            switch askingHero{
                
            case 1:
                player.characters.append(Warrior(name: askingName))
                print("                                         ")
                print("You chose a Warrior, named \(askingName)")
                print("                                         ")
            case 2:
                player.characters.append(Dwarf(name: askingName))
                print("                                         ")
                print("You chose a Dwarf, named \(askingName)")
                print("                                         ")
            case 3:
                player.characters.append(Thief(name: askingName))
                print("                                         ")
                print("You chose a Thief, named \(askingName)")
                print("                                         ")
            case 4:
                player.characters.append(Wizard(name: askingName))
                print("                                         ")
                print("You chose a Wizard, named \(askingName)")
                print("                                         ")
            case 5:
                player.characters.append(Healer(name: askingName))
                print("                                         ")
                print("You chose a Healer, named \(askingName)")
                print("                                         ")
            default: print("you have to chose between 1 and 5")
            }
        }
    }
    // Resume of each player's team
    func resumeOfTeams(){
        print("Entering battle phase.")
        for player in players {
            print("                                     ")
            print("\(player.name), you have the following heroes :")
            print("                                     ")
            for eachHeroes in player.characters{
                print("\(eachHeroes.heroDescription())")
            }
        }
        Battle()
    }
    // This function allow the player to choose a character, and the function control the user input.
    func chooseCharacter(for player: Player){
        for (index, availableHero) in player.characters.enumerated(){
            print("\(index + 1): \(availableHero.heroDescription())")
        }
        if let choosing = readLine(), let currentIndex = Int(choosing){
            if currentIndex > 0 && currentIndex <= player.characters.count{
                let selectedHero = player.characters[currentIndex - 1]
                print("       ")
                print("You have chosen \(selectedHero.heroDescription())")
                print("       ")
                choosingAnAction(for: selectedHero, in: player)
            }else{
                print("You have to chose a number between 1 and \(player.characters.count)")
                chooseCharacter(for: player)
            }
        }else{
            print("You didn't write any number, please choose between 1 and \(player.characters.count)")
            chooseCharacter(for: player)
        }
    }
    // If the chosen character is a healer, we redirect the player to chose on hero to heal, otherwise, we redirect the player to chose an enemy to attack.
    func choosingAnAction(for hero: Character, in player: Player){
        if hero is Healer{
            healChoice(for: hero, in: player)
        }else{
            attackChoice(for: hero, target: player)
        }
    }
    
    // The player must choose what character he wants to heal.
    func healChoice(for alliedHero: Character, in allyTeam: Player){
        print("Choose a character to heal.")
        print("             ")
        for (index, hero) in allyTeam.characters.enumerated(){
            print("\(index + 1): \(hero.name) has currently \(hero.healthPoints) HP.")
        }
        if let healing = readLine(), !healing.isEmpty, let currentIndex = Int(healing){
            if currentIndex > 0 && currentIndex <= allyTeam.characters.count{
                let heroToHeal = allyTeam.characters[currentIndex - 1]
                print("\(heroToHeal.name), is going to be healed by \(alliedHero.name) and his \(alliedHero.weapons) by \(alliedHero.heal) HP.")
                heroToHeal.healthPoints += alliedHero.heal
                print("\(heroToHeal.name) has now \(heroToHeal.healthPoints) HP.")
            }
            else{
                print("You must select between 1 and \(allyTeam.characters.count)")
                healChoice(for: alliedHero, in: allyTeam)
            }
        }
        else{
            print("Choose a valid number.")
            healChoice(for: alliedHero, in: allyTeam)
        }
    }
    
    
    func attackChoice(for alliedHero: Character, target enemyTeam: Player){
        
        let opposingTeam: Player = players.first(where: {$0 !== enemyTeam})!
        
        print("\(alliedHero.name), chose an enemy :")
            for (index, enemy) in opposingTeam.characters.enumerated(){
                print("\(index + 1): \(enemy.name) and has \(enemy.healthPoints) HP. ")
            }
        if let attack = readLine(), !attack.isEmpty, let currentIndex = Int(attack){
            if currentIndex > 0 && currentIndex <= opposingTeam.characters.count{
                let attackedHero = opposingTeam.characters[currentIndex - 1]
                attackedHero.healthPoints -= alliedHero.damage
                print("\(alliedHero.name), has done \(alliedHero.damage) damage with his \(alliedHero.weapons) to \(attackedHero.name)")
                print("\(attackedHero.name) has now \(attackedHero.healthPoints) HP.")
            }else{
                print("You must select between 1 and \(opposingTeam.characters.count)")
                attackChoice(for: alliedHero, target: enemyTeam)
            }
        }else{
            print("Choose a valid number.")
            attackChoice(for: alliedHero, target: enemyTeam)
        }
    }
        func Battle(){
            
            var numberOfTurn = 0
            var gameIsOn = true
            
            var firstPlayer = playerOne
            var secondPlayer = playerTwo
            
            while gameIsOn{
                
                print("        ")
                
                print("\(firstPlayer.name), you have to choose between your available heroes.")
                chooseCharacter(for: firstPlayer)
                
                
                swap(&firstPlayer, &secondPlayer)
                
                numberOfTurn += 1
                
                if numberOfTurn == 20{
                    gameIsOn = false
                }
            }
        }
    }







import Foundation
class GameSession {
    // This enum will serve us later to chose between attack and heal
    enum Action: Int, CaseIterable{
        case attack = 1
        case heal = 2
        case shield = 3
    }
    
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
                
                Battle()
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
        while true{
            guard let characterChoice = readLine(),
                          !characterChoice.isEmpty,
                          let indexOfCharacter = Int(characterChoice),
                          (1...5).contains(indexOfCharacter) else{
                            print("You must choose between 1 and 5")
                            continue
                            }
                    return indexOfCharacter
        }
    }
    
    // The player chose a hero between the 5 available
    func createHero(for player: Player){
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
    }
    // This function allow the player to choose a character, and the function control the user input.
    func chooseCharacter(for player: Player) -> Character{
        for (index, availableHero) in player.characters.enumerated(){
            print("\(index + 1): \(availableHero.heroDescription())")
        }
        while true{
            guard let choosing = readLine(),
                          let currentIndex = Int(choosing),
                          currentIndex > 0 && currentIndex <= player.characters.count else {
                            print("You have to chose between 1 and \(player.characters.count)")
                            continue
                            }
                        
                            let selectedHero = player.characters[currentIndex - 1]
            
                            print("       ")
                            print("You have chosen \(selectedHero.heroDescription())")
                            print("       ")
                            
                            return selectedHero
                    }
        }
        
    
    // We ask the player if he wants to attack or heal.
    func chooseAction(for hero: Character) -> Action{
        print("Choose an action for \(hero.name) !")
        print("""
        1. Attack ⚔️
        2. Heal ❤️
        3. Shield 🛡️
        """)
        while true{
            guard let choice = readLine(),
                  !choice.isEmpty,
                  let choosingAction = Int(choice),
                  let rawChoice = Action(rawValue: choosingAction) else{
                        print("You must choose between 1 and 3")
                        continue
            }
               return rawChoice
        }
    }
    
    func confirmAction(for action : Action, for character: Character, for player: Player){
        switch action{
        case .attack :
            return attackChoice(for: character, target: player)
        case .heal :
            return healChoice(for: character, in: player)
        case .shield :
            return shieldChoice(for: character, in: player)
        }
    }
    func shieldChoice(for hero: Character, in alliedTeam: Player){
        print("""
        \(hero.name), choose a character to protect.
        1 Level of shield = 1 attack divided by two.
        ⚠️ 3 SHIELDS MAX PER CHARACTER, OR IT WILL SKIP YOUR ACTION. ⚠️
        """)
        for (index, hero) in alliedTeam.characters.enumerated(){
            print("\(index + 1): \(hero.name) has currently \(hero.healthPoints) HP.")
        }
        while true{
            guard let shieldingChoice = readLine(),
                  !shieldingChoice.isEmpty,
                  let indexOfShield = Int(shieldingChoice),
                  indexOfShield > 0 && indexOfShield <= alliedTeam.characters.count else{
                        print("You must select between 1 and \(alliedTeam.characters.count)")
                        continue
                }
            
                let heroToShield = alliedTeam.characters[indexOfShield - 1]
                let maxShieldPerCharacter = 3
                
                
                if heroToShield.shield == maxShieldPerCharacter{
                    print("     ")
                    print("The maximum amount of shield is 3. I've warned you, now wait for your turn 🤡.")
                    print("     ")
                    break
                } else {
                    heroToShield.shield += 1
                }
                
                print("\(hero.name), is going to protect \(heroToShield.name) from 1 attacks")
                
            print("\(heroToShield.name), has now \(heroToShield.shield) level of shield. Wise choice !")
                
                break
        }
    }
    // The player must choose what character he wants to heal.
    func healChoice(for alliedHero: Character, in allyTeam: Player){
        print("\(alliedHero.name), choose a character to heal.")
        print("             ")
        for (index, hero) in allyTeam.characters.enumerated(){
            print("\(index + 1): \(hero.name) has currently \(hero.healthPoints) HP.")
        }
        while true{
            guard let healing = readLine(),
                  !healing.isEmpty,
                  let currentIndex = Int(healing),
                  currentIndex > 0 && currentIndex <= allyTeam.characters.count else {
                        print("You must select between 1 and \(allyTeam.characters.count)")
                        continue
                        }
                            let heroToHeal = allyTeam.characters[currentIndex - 1]
            
                            print("\(heroToHeal.name), is going to be healed by \(alliedHero.name) and increase his HP by \(alliedHero.heal)")
            
                            heroToHeal.healthPoints += alliedHero.heal
            
                            print("\(heroToHeal.name) has now \(heroToHeal.healthPoints) HP.")
                    break
                }
        }
    
    
    // The player choose which character to attack
    func attackChoice(for attackingHero: Character, target enemyTeam: Player){
        
        let opposingTeam: Player = players.first(where: {$0 !== enemyTeam})!
        
        print("\(attackingHero.name), chose an enemy :")
        for (index, enemy) in opposingTeam.characters.enumerated(){
            print("\(index + 1): \(enemy.name) and has \(enemy.healthPoints) HP. ")
        }
        while true{
            
                guard let attackChoice = readLine(),
                !attackChoice.isEmpty,
                let currentIndex = Int(attackChoice),
                currentIndex > 0 && currentIndex <= opposingTeam.characters.count else{
                
                print("You must choose between 1 and \(opposingTeam.characters.count)")
                continue
                }
                    let attackedHero = opposingTeam.characters[currentIndex - 1]
            
                    print("\(attackingHero.name), deals \(attackingHero.damage) damage with his \(attackingHero.weapons) to \(attackedHero.name)")
            
                    //If the attacked Hero has a level of shield, we reduce the damage received by two and we reduce the level of the shield by one.
                    //Else, we attack normally.
                    if attackedHero.shield > 0{
                        print("\(attackedHero.name) is protected by a shield, the damage he received are divided by two !")
                        attackedHero.healthPoints -= attackingHero.damage / 2
                        attackedHero.shield -= 1
                    } else {
                        attackedHero.healthPoints -= attackingHero.damage
                    }
                    
                    // If the character has 0 healthPoints or less. We remove it from the game.
                    if attackedHero.healthPoints <= 0{
                        print("\(attackedHero.name) has \(attackedHero.healthPoints) HP. He's dead.")
                        opposingTeam.characters.remove(at: currentIndex - 1)
                    }
                    print("\(attackedHero.name) has now \(attackedHero.healthPoints) HP.")
                break
            }
        }

    // In this function, we create a loop while, who will loop until one of the two players has no characters alive. The winner is printed as well.
    func Battle(){
        
        var numberOfTurn = 0
        var gameOver = false
        
        while !gameOver{
            print("        ")
            
            for currentPlayer in players {
                
                print("\(currentPlayer.name), you have to choose between your available heroes.")
                
                let selectedCharacter = chooseCharacter(for: currentPlayer)
                
                let selectAction = chooseAction(for: selectedCharacter)
                
                confirmAction(for: selectAction, for: selectedCharacter, for: currentPlayer)
                
                gameOver = declareWinner(for: numberOfTurn)
                
                // If game over is true, you start an other game.
                if gameOver{
                    return Game().startingTheGame()
                }
            }
            if !gameOver{
                numberOfTurn += 1
                print("Round: \(numberOfTurn)")
            }
        }
    }
    // If there is a player who has no character alive, it become the loser, and we print the winner and all these characters alive.
    func declareWinner(for turn: Int) -> Bool{
        var looser: Player?
        for currentPlayer in players {
            if currentPlayer.characters.isEmpty{
                looser = currentPlayer
                break
            }
        }
        if let looser, let winner = players.first(where: {$0 !== looser}){
            print("     ")
            print("Congratulations, \(winner.name), you've won the game in \(turn) rounds !")
            for aliveCharacter in winner.characters{
                print("        ")
                print("When you won, you had these characters :")
                print("\(aliveCharacter.heroDescription())")
                print("         ")
                print("         ")
            }
            return true
        }
        return false
    }
}

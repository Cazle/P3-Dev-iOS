import Foundation
class GameSession {
    
    // Declare two players with both name
    var playerOne = Player(name: "Player one")
    var playerTwo = Player(name: "Player two")
    
    // Variable to handle our two players
    var players: [Player] {
        return [playerOne, playerTwo]
    }
    
    var maxHeroesPerPlayer = 1
    
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
    func askHero() -> Int {
        print("""
        1. Warrior ⚔️
        2. Dwarf ⛏️
        3. Thief 🥷
        4. Wizard 🧙‍♂️
        5. Healer 🧝🏼‍♂️
        """)
		
		while true {
			guard
				let characterChoice = readLine(),
				let heroChoice = Int(characterChoice),
				(1...5).contains(heroChoice) else {
				print("You must choose between 1 and 5.")
				continue
			}
			
			return heroChoice
		}
    }
    
    // The player chose a hero between the 5 available
    func createHero(for player: Player){
        print("                                         ")
        print("\(player.name), you have to chose 3 heroes.")
        print("                                         ")
        
        while player.characters.count < maxHeroesPerPlayer {
            print("\(player.name), you've got \(player.characters.count + 1) on 3")
            
			let askingHero = askHero()
            let askingName = askName()
			
            switch askingHero {
                
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
    func resumeOfTeams() {
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
    func chooseCharacter(for player: Player) -> Character {
        for (index, availableHero) in player.characters.enumerated() {
            print("\(index + 1): \(availableHero.heroDescription())")
        }
		
		while true {
			guard let choosing = readLine(), let currentIndex = Int(choosing), currentIndex > 0 && currentIndex <= player.characters.count else {
				print("You have to chose a number between 1 and \(player.characters.count)")
				continue
			}
			
			let selectedHero = player.characters[currentIndex - 1]
			print("       ")
			print("You have chosen \(selectedHero.heroDescription())")
			print("       ")
			
			return selectedHero
		}
    }
	
    // If the chosen character is a healer, we redirect the player to chose on hero to heal, otherwise, we redirect the player to chose an enemy to attack.
    func chooseAction(for hero: Character) -> Action {
        print("Choose an action for \(hero.name) !")
        print("""
        1. Attack ⚔️
        2. Heal ❤️
        """)
		
		while true {
			guard let choice = readLine(), let rawChoice = Int(choice), let selectedAction = Action(rawValue: rawChoice) else {
				print("You must chose between 1 and 2")
				continue
			}
			
			return selectedAction
		}
    }
    
    // The player must choose what character he wants to heal.
    func healChoice(for alliedHero: Character, in allyTeam: Player){
        print("Choose a character to heal.")
        print("             ")
        for (index, hero) in allyTeam.characters.enumerated(){
            print("\(index + 1): \(hero.name) has currently \(hero.healthPoints) HP.")
        }
		
		while true {
			guard
				let healing = readLine(),
				!healing.isEmpty,
				let selectedIndex = Int(healing),
				selectedIndex > 0 && selectedIndex <= allyTeam.characters.count else {
				print("You must select between 1 and \(allyTeam.characters.count)")
				continue
			}
			
			let heroToHeal = allyTeam.characters[selectedIndex - 1]
			
			print("\(heroToHeal.name), is going to be healed by \(alliedHero.name) and increase his HP by \(alliedHero.heal)")
			
			heroToHeal.healthPoints += alliedHero.heal
			
			print("\(heroToHeal.name) has now \(heroToHeal.healthPoints) HP.")
			
			break
		}
    }
    
    // The player choose which character to attack
    // With the constant "opposingTeam", we search the first player team among players who is different than our current player, we can force unwrap since we know there's only two players.
    func attackChoice(for alliedHero: Character, target enemyTeam: Player){
        print("\(alliedHero.name), choose an enemy :")
		for (index, enemy) in enemyTeam.characters.enumerated()  {
			print("\(index + 1): \(enemy.name) and has \(enemy.healthPoints) HP. ")
		}
		
		while true {
			guard
				let attackChoice = readLine(),
				!attackChoice.isEmpty,
				let selectedIndex = Int(attackChoice),
				selectedIndex > 0 && selectedIndex <= enemyTeam.characters.count else {
				print("You must select between 1 and \(enemyTeam.characters.count)")
				continue
			}
			
			let attackedHero = enemyTeam.characters[selectedIndex - 1]
			
			// The current hero deals damage to the chosen ennemy "attackedHero"
			attackedHero.healthPoints -= alliedHero.damage
			
			print("\(alliedHero.name), has done \(alliedHero.damage) damage with his \(alliedHero.weapons) to \(attackedHero.name)")
			print("\(attackedHero.name) has now \(attackedHero.healthPoints) HP.")
			
			// If the chosen enemy has 0 Healthpoints or less, we remove it from the array. He's dead.
			
			if attackedHero.healthPoints <= 0 {
				print("\(attackedHero.name) has \(attackedHero.healthPoints) HP. He's dead.")
				enemyTeam.characters.remove(at: selectedIndex - 1)
			}
			
			break
		}
    }

    // In this function, we create a loop while, who will loop until one of the two players has no characters alive. The winner is printed as well.
    func Battle() {
        var numberOfTurn = 0
        var gameHasEnded = false
        
        while !gameHasEnded {
			for currentPlayer in players {
				print("        ")
				print("\(currentPlayer.name), you have to choose between your available heroes.")
				
				let selectedCharacter = chooseCharacter(for: currentPlayer)
				
				let selectedAction = chooseAction(for: selectedCharacter)
				
				resolveAction(action: selectedAction, selectedCharacter: selectedCharacter, for: currentPlayer)
				
				gameHasEnded = checkIfGameHasEnded()
				
				if gameHasEnded {
					break;
				}
			}
			
			if !gameHasEnded {
				numberOfTurn += 1
			}
        }
		
		// TODO: Restart or quit game
    }
	
	func resolveAction(action: Action, selectedCharacter: Character, for player: Player) {
		switch action {
		case .attack:
			if let otherPlayer = players.first(where: { $0 !== player }) {
				attackChoice(for: selectedCharacter, target: otherPlayer)
			}
			
		case .heal:
			healChoice(for: selectedCharacter, in: player)
		}
	}
	
	func checkIfGameHasEnded() -> Bool {
		var looser: Player?
		for currentPlayer in players {
			if currentPlayer.characters.allSatisfy({ $0.healthPoints <= 0 }) {
				looser = currentPlayer
				break;
			}
		}
		
		if let looser, let winner = players.first(where: { $0 !== looser }) {
			print("             ")
			print("\(winner.name), has won the game ! Congratulations ! 🌟")
			print("You had these characters when you won:")
			print("             ")
			
			for characterRemaining in winner.characters {
				print("""
			\(characterRemaining.heroDescription())
			""")
			}
			
			return true
		}
		
		return false
	}
	
    func restartingTheGame(){
        print("                 ")
        print("Would you like to restart the game ?")
        print("""
        1: Restarting the game
        2: Exit the game
        """)
        let choice = readLine()
        
        switch choice{
        case "1":
            playerOne.characters.removeAll()
            playerTwo.characters.removeAll()
            let newGame = Game()
            newGame.startingTheGame()
        case "2":
            print("Thanks for playing the new game of the FrenchGame company, we hope to see you soon !")
            exit(0)
        default: print("You must choose between 1 and 2")
        }
    }
}

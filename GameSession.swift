import Foundation

class GameSession {
	
	private let numberOfHeroesPerPlayer = 2
	
	// Declare two players with both name
	var playerOne = Player(name: "Player one")
	var playerTwo = Player(name: "Player two")
	
	var players: [Player] {
		return [playerOne, playerTwo]
	}
	
	func startGame() {
		print("Starting a new game!")
		
		createTeams(for: players)
	}
	
	func createTeams(for players: [Player]) {
		print("Players, ready yourself and create your teams!")
		
		for currentPlayer in players {
			createTeam(for: currentPlayer)
		}
		
		for currentPlayer in players {
			print("\(currentPlayer.name) has selected the following heroes:")
			
			for currentHero in currentPlayer.heroes {
				print(currentHero.userDescription())
			}
		}
	}
	
	func createTeam(for player: Player) {
		print("\(player.name), ready yourself and select your heroes!")

		while player.heroes.count < numberOfHeroesPerPlayer {
			print("Select hero number \(player.heroes.count + 1)")
			
			let newHero = createHero()
			
			player.heroes.append(newHero)
		}
	}
	
	func createHero() -> Hero {
		let heroType = askForHeroType()
		let heroName = askForHeroName()
		
		switch heroType {
		case .warrior:
			return Warrior(name: heroName)
		case .wizard:
			return Wizard(name: heroName)
		case .thief:
			return Thief(name: heroName)
		case .healer:
			return Healer(name: heroName)
		case .dwarf:
			return Dwarf(name: heroName)
		}
	}
	
	func askForHeroName() -> String {
		var heroName = ""
		
		while heroName.isEmpty {
			print("Please provide a hero name:")
			
			let newHeroName = readLine()
			
			if let newHeroName, !newHeroName.isEmpty {
				let allHeroes = players.flatMap { currentPlayer in currentPlayer.heroes }
				
				var hasFoundDuplicateName = false
				for currentHero in allHeroes {
					if currentHero.name == newHeroName {
						hasFoundDuplicateName = true
						break
					}
				}
				
				if hasFoundDuplicateName {
					print("There is already a hero with this name, please choose another.")
				} else {
					heroName = newHeroName
				}
			} else {
				print("Invalid hero name")
			}
		}
		
		return heroName
	}
	
	func askForHeroType() -> Hero.HeroType {
		// Get an array with the available hero type
		let heroTypes = Hero.HeroType.allCases.map { $0.rawValue }
		
		while true {
			print("Please select the hero type:")
			
			// Display available hero types
			for currentHeroType in heroTypes {
				let currentIndex = heroTypes.firstIndex(of: currentHeroType) ?? 0
				print("\(currentIndex). \(currentHeroType)")
			}
			
			let newHeroType = readLine()
			
			// Check that the selected hero type is an Int AND that it exists in the available hero types
			if let newHeroType, let heroTypeIndex = Int(newHeroType), heroTypes.count > heroTypeIndex {
				let selectedHeroType = Hero.HeroType.allCases[heroTypeIndex]
				
				return selectedHeroType
			} else {
				print("Please, select a valid hero type!")
			}
		}
	}
}

Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test01whenAGameStartsThenItReturnsItsName [

	| aGame aShip aCollectionOfShips aChargedDice |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aChargedDice.
	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02whenAGameStartsWithASpecificNameThenItKnowsItsName [

	| aGame aShip aCollectionOfShips aChargedDice |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aGame := Game
		         createWithName: 'Generala'
		         andShips: aCollectionOfShips
		         andABordOf: 10
					andADice: aChargedDice.
	self assert: aGame start equals: 'Generala'
]

{ #category : 'tests' }
GameTest >> test03whenTheGameTellsTheShipToMoveThenTheShipsChanges [

	| aGame aShip aCollectionOfShips aChargedDice |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
					andADice: aChargedDice.
					
	aGame moves: aShip.
	self assert: (aGame theShip: aShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test04WhenAGameCreatesAnNBoardThenTheBoardInGameHaveNCells [

	| aGame aShip aCollectionOfShips aChargedDice |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
					andADice: aChargedDice.

	self assert: (aGame boardSize) equals: 10
]

{ #category : 'tests' }
GameTest >> test05WhenAGameThrowsTheDiceToMoveAShipThenTheShipMovesToTheCell [

	| aGame aShip aCollectionOfShips aChargedDice |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
					andADice: aChargedDice.
					
	aGame moves: aShip.

	self assert: (aGame theShip: aShip isAt: 5)
]

Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name',
		'board',
		'diceCollection',
		'shipsInGame',
		'currentIndexOfShipPlaying'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andShips: aCollectionOfShips andABord: aBoard andADice: aCollectionOfDice [ 

	self validateCollection: aCollectionOfDice with: aBoard numberOfCells .

	^ self new
		  initializeWithName: aBoardName
		  andBoard: aBoard
		  andShips: aCollectionOfShips
		  andADice: aCollectionOfDice
]

{ #category : 'as yet unclassified' }
Game class >> validateCollection: aCollection with: amountOfCells [

	| total |
	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one dice in the game' ].

	total := 0.
	aCollection do: [ :aDie | total := total + aDie throw ].

	total > amountOfCells ifTrue: [
			Error signal:
				'There of the dices must be lower than the amount of cells' ]
]

{ #category : 'as yet unclassified' }
Game >> boardSize [

	^ board numberOfCells
]

{ #category : 'testing' }
Game >> canPlay [

	board canPlay ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : 'testing' }
Game >> hasFinishedAndWinnerIs: aShip [

	^ board winnerShip: aShip
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andBoard: aBoard andShips: aCollectionOfShips andADice: aCollectionOfDice [

	name := aName.
	diceCollection := aCollectionOfDice.
	board := aBoard.
	shipsInGame := aCollectionOfShips.
	currentIndexOfShipPlaying := 0
]

{ #category : 'as yet unclassified' }
Game >> moveWithoutEffect: aShip by: aNumber [
	aShip advancesToWithoutEffect: aNumber in: board .
]

{ #category : 'as yet unclassified' }
Game >> moves [

	| total |
	self canPlay.
	total := diceCollection sum: [ :aDie | aDie throw ].


	self nextShipToPlay advancesTo: total  in: board of: self.
]

{ #category : 'as yet unclassified' }
Game >> nextShipToPlay [

	| ship |
	ship := shipsInGame at: currentIndexOfShipPlaying + 1.

	currentIndexOfShipPlaying := currentIndexOfShipPlaying + 1
	                             \\ shipsInGame size.

	^ ship
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

{ #category : 'accessing' }
Game >> theShip: aShip isAt: aPosition [

	^ board hasTheShip: aShip atThePosition: aPosition
]

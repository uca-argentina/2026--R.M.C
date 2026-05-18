Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name',
		'board',
		'diceCollection',
		'shipsInGame',
		'currentIndexOfShipPlaying',
		'lapmanager',
		'shipPositionManager',
		'aShipTurnManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andAShipPositionManager: aPositionShipManager andATurnManager: aTurnManager andABord: aBoard andADice: aCollectionOfDice [ 

	^ self new
		  initializeWithName: aBoardName
		  andBoard: aBoard
		  andADice: aCollectionOfDice
		  andATurnManger:aTurnManager 
		  andAPositionManager: aPositionShipManager.
]

{ #category : 'as yet unclassified' }
Game class >> validateCollection: aCollection with: amountOfCells [

	| total |
	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one dice in the game' ].

	total := 0.
	aCollection do: [ :aDie | total := total + aDie throw ].

]

{ #category : 'as yet unclassified' }
Game >> boardSize [

	^ board numberOfCells
]

{ #category : 'testing' }
Game >> canPlay [

	shipPositionManager hasFinished ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : 'testing' }
Game >> hasFinishedAndWinnerIs: aShip [

	^ shipPositionManager hasWon: aShip
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andBoard: aBoard andADice: aCollectionOfDice andATurnManger: aTurnManager andAPositionManager: aPositionShipManager [

	name := aName.
	board := aBoard.
	diceCollection := aCollectionOfDice.
	aShipTurnManager := aTurnManager.
	shipPositionManager := aPositionShipManager
]

{ #category : 'as yet unclassified' }
Game >> move: aShip by: anAmount [

	shipPositionManager
		move: aShip
		by: anAmount
		inBoardOfSize: board numberOfCells
]

{ #category : 'as yet unclassified' }
Game >> moveAllShipsExcept: aShip by: anAmount [

	shipPositionManager
		moveAllShipsExcept: aShip
		by: anAmount  
		inBoardOfSize: board numberOfCells
]

{ #category : 'as yet unclassified' }
Game >> moveBackToZero: aShip [

	shipPositionManager moveToZero: aShip
]

{ #category : 'as yet unclassified' }
Game >> moves [

	| sumOfTheDices shipToPlay movementEffect |
	self canPlay.

	sumOfTheDices := diceCollection sum: [ :aDie | aDie throw ].
	shipToPlay := aShipTurnManager nextShipToPlayInGame.

	movementEffect := shipPositionManager
		                  movementEffectFor: shipToPlay
		                  moving: sumOfTheDices
		                  inBoardOfSize: board numberOfCells
		                  modifiedBy: [ :futurePosition |
			                  board
				                  effectForLandingAt: futurePosition
				                  startingWith: sumOfTheDices ].

	movementEffect applyTo: shipToPlay in: self
]

{ #category : 'as yet unclassified' }
Game >> nextShipToPlay [

	| ship |
	ship := shipsInGame at: currentIndexOfShipPlaying + 1.

	currentIndexOfShipPlaying := currentIndexOfShipPlaying + 1
	                             \\ shipsInGame size.

	^ ship
]

{ #category : 'as yet unclassified' }
Game >> ranking [
    ^ shipPositionManager currentRanking
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

{ #category : 'accessing' }
Game >> theShip: aShip isAt: aPosition [

	^ shipPositionManager is: aShip atPosition: aPosition
]

{ #category : 'as yet unclassified' }
Game >> theShip: aShip isAtLap: aLap [

	^ shipPositionManager is: aShip atLap: aLap
]

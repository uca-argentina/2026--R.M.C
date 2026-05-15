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
		'shipPositionManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andShips: aCollectionOfShips andABord: aBoard andADice: aCollectionOfDice andNumberOfLaps: aNumber [

	| aPositionShipManager |
	aPositionShipManager := PositionShipManager createWith: aCollectionOfShips andNumberOfLaps: aNumber.
	self validateCollection: aCollectionOfDice with: aBoard numberOfCells  .

	^ self new
		  initializeWithName: aBoardName
		  andBoard: aBoard
		  andShips: aCollectionOfShips
		  andADice: aCollectionOfDice
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
Game >> __moves [

	| total shipToPlay |

	self canPlay.
	total := diceCollection sum: [ :aDie | aDie throw ].
	shipToPlay := self nextShipToPlay.

	shipPositionManager
		move: shipToPlay
		by: total
		inBoardOfSize: board numberOfCells.
	
	
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
Game >> initializeWithName: aName andBoard: aBoard andShips: aCollectionOfShips andADice: aCollectionOfDice andAPositionManager: ashipPositionManager [ 
	name := aName.
	diceCollection := aCollectionOfDice.
	board := aBoard.
	shipsInGame := aCollectionOfShips.
	currentIndexOfShipPlaying := 0.
	shipPositionManager:=ashipPositionManager.
]

{ #category : 'as yet unclassified' }
Game >> moves [

	| sumOfTheDices shipToPlay finalMovement |

	self canPlay.

	sumOfTheDices := diceCollection sum: [ :aDie | aDie throw ].
	shipToPlay := self nextShipToPlay.

	finalMovement := shipPositionManager
		movementFor: shipToPlay
		moving: sumOfTheDices
		inBoardOfSize: board numberOfCells
		modifiedBy: [ :futurePosition |
			board
				modifyMovementForLandingAt: futurePosition
				startingWith: sumOfTheDices
		].

	shipPositionManager
		move: shipToPlay
		by: finalMovement
		inBoardOfSize: board numberOfCells.
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

	^ shipPositionManager
		is: aShip
		atPosition: aPosition
]

{ #category : 'as yet unclassified' }
Game >> theShip: aShip isAtLap: aLap [

	^ shipPositionManager
		is: aShip
		atLap: aLap.
]

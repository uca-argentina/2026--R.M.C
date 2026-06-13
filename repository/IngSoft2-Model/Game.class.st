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
		'aShipTurnManager',
		'aCardsManager',
		'targeplayer',
		'aCard',
		'aPenaltyShips'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andAShipPositionManager: aPositionShipManager andATurnManager: aTurnManager andABord: aBoard andADice: aCollectionOfDice [

	self validateCollection: aCollectionOfDice.
	^ self new
		  initializeWithName: aBoardName
		  andBoard: aBoard
		  andADice: aCollectionOfDice
		  andATurnManger: aTurnManager
		  andAPositionManager: aPositionShipManager
]

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andAShipPositionManager: aPositionShipManager andATurnManager: aTurnManager andABord: aBoard andADice: aCollectionOfDice andACardManager:aCardManager [

	self validateCollection: aCollectionOfDice.
	^ self new
		  initializeWithName: aBoardName
		  andBoard: aBoard
		  andADice: aCollectionOfDice
		  andATurnManger: aTurnManager
		  andAPositionManager: aPositionShipManager
	     andACardManager:aCardManager

]

{ #category : 'as yet unclassified' }
Game class >> validateCollection: aCollection [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one dice in the game' ]
]

{ #category : 'as yet unclassified' }
Game >> PayerShip: aShip PlaysCard: aSobreCarga toTarget: aShip3 [ 
	targeplayer:=aShip3.
	aShip PlaysCardFromGame:self LookForCardinShip:aSobreCarga.
]

{ #category : 'as yet unclassified' }
Game >> Showcardsfromplayer: aShip [ 
	^aShip hasCardLeft.
]

{ #category : 'as yet unclassified' }
Game >> appliesCard: aSobreCarga [ 
	| apenalty |
	apenalty:=aSobreCarga penalty.
	aPenaltyShips add:{targeplayer. apenalty}.
]

{ #category : 'as yet unclassified' }
Game >> appliesPenaltyTo: aShip [ 
	self shouldBeImplemented.
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
	shipPositionManager := aPositionShipManager.
	aPenaltyShips:=OrderedCollection new.
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andBoard: aBoard andADice: aCollectionOfDice andATurnManger: aTurnManager andAPositionManager: aPositionShipManager andACardManager:aCardManager [

	name := aName.
	board := aBoard.
	diceCollection := aCollectionOfDice.
	aShipTurnManager := aTurnManager.
	shipPositionManager := aPositionShipManager.
	aCardsManager:=aCardManager.
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
Game >> penaltyAppliedToShip: aShip [ 
| aPenalties aPenaltiesvalue|
(aPenaltyShips anySatisfy: [ :each | each first = aShip ]) ifFalse: [ ^0 ].
aPenalties := (aPenaltyShips select: [ :each | each first = aShip ])
                    collect: [ :each | each second ].
aPenaltiesvalue:=aPenalties first.
^aPenaltiesvalue.
]

{ #category : 'as yet unclassified' }
Game >> playturn [

	| sumOfTheDices shipToPlay movementEffect throwwithpenalty |
	self canPlay.
   shipToPlay := aShipTurnManager nextShipToPlayInGame.
	throwwithpenalty:= (self penaltyAppliedToShip:shipToPlay) .
	sumOfTheDices := (diceCollection sum: [ :aDie | aDie throw ])+throwwithpenalty.
	
	

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

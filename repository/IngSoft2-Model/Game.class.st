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
Game >> PayerShip: aShip PlaysCard: aCards toTarget: aTargetShip [

	targeplayer := aTargetShip.
	aShip playsCardFromGame: self LookForCardInShip: aCards.
	self applyRepeatedMovementEffectIfNeededTo: aTargetShip
]

{ #category : 'as yet unclassified' }
Game >> Showcardsfromplayer: aShip [ 
	^aShip hasCardLeft.
]

{ #category : 'as yet unclassified' }
Game >> appliesCard: aCard [
    aCardsManager applyCard: aCard toTarget: targeplayer.
]

{ #category : 'as yet unclassified' }
Game >> applyRepeatedMovementEffectIfNeededTo: aTargetShip [

	| repeatedEffect |

	repeatedEffect := aCardsManager repeatedMovementEffect.

	repeatedEffect ifNil: [ ^ self ].

	repeatedEffect applyTo: aTargetShip in: self.
	aCardsManager clearRepeatedMovementEffect
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
	aCardsManager := CardManager new.
	
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
  ^ aCardsManager penaltyFor: aShip
]

{ #category : 'as yet unclassified' }
Game >> playturn [

	| sumOfTheDices shipToPlay movementEffect throwwithpenalty |
	self canPlay.
	shipToPlay := aShipTurnManager nextShipToPlayInGame.
	throwwithpenalty := self penaltyAppliedToShip: shipToPlay.
	sumOfTheDices := (diceCollection sum: [ :aDie | aDie throw ])
	                 + throwwithpenalty.



	movementEffect := shipPositionManager
		                  movementEffectFor: shipToPlay
		                  moving: sumOfTheDices
		                  inBoardOfSize: board numberOfCells
		                  modifiedBy: [ :futurePosition |
			                  board
				                  effectForLandingAt: futurePosition
				                  startingWith: sumOfTheDices ].

	aCardsManager updateLastMovementEffect: movementEffect.
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

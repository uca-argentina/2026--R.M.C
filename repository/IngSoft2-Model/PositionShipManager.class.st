Class {
	#name : 'PositionShipManager',
	#superclass : 'Object',
	#instVars : [
		'allShips',
		'currentIndexOfShipPlaying',
		'numberOfLaps',
		'lapsToWin',
		'shipStatuses'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
PositionShipManager class >> createWith: aCollectionOfShips andNumberOfLaps: aNumberOfLaps [

	self validate: aCollectionOfShips and: aNumberOfLaps .
	^ self new initializeWith: aCollectionOfShips and:aNumberOfLaps .
]

{ #category : 'as yet unclassified' }
PositionShipManager class >> validate: aCollection and: aNumber [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one ship in de manager of positions' ].
	
	(aNumber >= 0) ifFalse: [
		Error signal: 'There must be a lap in race' ].
]

{ #category : 'as yet unclassified' }
PositionShipManager >> Lap [
	^0.
]

{ #category : 'testing' }
PositionShipManager >> hasFinished [

	^ shipStatuses anySatisfy: [ :aShipStatus |
		aShipStatus hasCompleted: lapsToWin
	]
]

{ #category : 'initialization' }
PositionShipManager >> hasWon: aShip [

	^ (self statusOf: aShip) hasCompleted: lapsToWin
]

{ #category : 'initialization' }
PositionShipManager >> initializeWith: aCollectionOfShips and: aNumberOfLaps [
	lapsToWin := aNumberOfLaps.
	shipStatuses := aCollectionOfShips collect: [ :aShip |
		ShipRaceStatus for: aShip
	].
]

{ #category : 'testing' }
PositionShipManager >> is: aShip atLap: aLap [

	^ (self statusOf: aShip)
		isAtLap: aLap
]

{ #category : 'initialization' }
PositionShipManager >> is: aShip atPosition: aPosition [

	^ (self statusOf: aShip) isAtPosition: aPosition
]

{ #category : 'initialization' }
PositionShipManager >> move: aShip by: anAmount inBoardOfSize: aBoardSize [

	(self statusOf: aShip)
		advanceBy: anAmount
		inBoardOfSize: aBoardSize
]

{ #category : 'as yet unclassified' }
PositionShipManager >> moveAllShipsExcept: aShip backBy: anAmount inBoardOfSize: aBoardSize [

	shipStatuses do: [ :aShipStatus |
			(aShipStatus isFor: aShip) ifFalse: [
				aShipStatus advanceBy: anAmount inBoardOfSize: aBoardSize ] ]
]

{ #category : 'as yet unclassified' }
PositionShipManager >> movementEffectFor: aShip moving: sumOfDices inBoardOfSize: aBoardSize modifiedBy: aFutureBlock [

	^ (self statusOf: aShip)
		movementEffectAfterMoving: sumOfDices
		inBoardOfSize: aBoardSize
		modifiedBy: aFutureBlock
]

{ #category : 'initialization' }
PositionShipManager >> statusOf: aShip [

	^ shipStatuses detect: [ :aShipStatus |
		aShipStatus isFor: aShip
	]
]

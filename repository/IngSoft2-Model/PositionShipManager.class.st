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
	^ self new initializeWith: aCollectionOfShips and:aNumberOfLaps .
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

{ #category : 'initialization' }
PositionShipManager >> moveAllShipsExcept: aShip backBy: anAmount inBoardOfSize: aBoardSize [

	shipStatuses do: [ :aShipStatus |
		(aShipStatus isFor: aShip) ifFalse: [
			aShipStatus
				goBackBy: anAmount
				inBoardOfSize: aBoardSize
		]
	]
]

{ #category : 'initialization' }
PositionShipManager >> moveBack: aShip by: anAmount inBoardOfSize: aBoardSize [

	(self statusOf: aShip)
		goBackBy: anAmount
		inBoardOfSize: aBoardSize
]

{ #category : 'initialization' }
PositionShipManager >> sendAllShipsToStart [

	shipStatuses do: [ :aShipStatus |
		aShipStatus sendToStart
	]
]

{ #category : 'initialization' }
PositionShipManager >> statusOf: aShip [

	^ shipStatuses detect: [ :aShipStatus |
		aShipStatus isFor: aShip
	]
]

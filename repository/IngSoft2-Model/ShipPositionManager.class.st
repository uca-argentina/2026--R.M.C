Class {
	#name : 'ShipPositionManager',
	#superclass : 'Object',
	#instVars : [
		'lapsToWin',
		'shipStatuses'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ShipPositionManager class >> createWith: aCollectionOfShips andNumberOfLaps: aNumberOfLaps [

	self validate: aCollectionOfShips and: aNumberOfLaps .
	^ self new initializeWith: aCollectionOfShips and:aNumberOfLaps .
]

{ #category : 'as yet unclassified' }
ShipPositionManager class >> validate: aCollection and: aNumber [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one ship in de manager of positions' ].
	
	(aNumber >= 0) ifFalse: [
		Error signal: 'There must be a lap in race' ].
]

{ #category : 'as yet unclassified' }
ShipPositionManager >> currentRanking [
    | snapshots |
    snapshots := shipStatuses collect: [ :status | status snapshot ].
    ^ RaceRanking createWithStatus: snapshots
]

{ #category : 'testing' }
ShipPositionManager >> hasFinished [

	^ shipStatuses anySatisfy: [ :aShipStatus |
		  aShipStatus hasCompleted: lapsToWin ]
]

{ #category : 'initialization' }
ShipPositionManager >> hasWon: aShip [

	^ (self statusOf: aShip) hasCompleted: lapsToWin
]

{ #category : 'initialization' }
ShipPositionManager >> initializeWith: aCollectionOfShips and: aNumberOfLaps [

	lapsToWin := aNumberOfLaps.
	shipStatuses := aCollectionOfShips collect: [ :aShip |
		                ShipRaceStatus for: aShip ]
]

{ #category : 'testing' }
ShipPositionManager >> is: aShip atLap: aLap [

	^ (self statusOf: aShip)
		isAtLap: aLap
]

{ #category : 'initialization' }
ShipPositionManager >> is: aShip atPosition: aPosition [

	^ (self statusOf: aShip) isAtPosition: aPosition
]

{ #category : 'initialization' }
ShipPositionManager >> move: aShip by: anAmount inBoardOfSize: aBoardSize [

	(self statusOf: aShip) advanceBy: anAmount inBoardOfSize: aBoardSize
]

{ #category : 'as yet unclassified' }
ShipPositionManager >> moveAllShipsExcept: aShip by: anAmount inBoardOfSize: aBoardSize [

	shipStatuses do: [ :aShipStatus |
			(aShipStatus isFor: aShip) ifFalse: [
				aShipStatus advanceBy: anAmount inBoardOfSize: aBoardSize ] ]
]

{ #category : 'as yet unclassified' }
ShipPositionManager >> moveToZero: aShip [

	shipStatuses do: [ :aShipStatus |aShipStatus moveToZero  ]
]

{ #category : 'as yet unclassified' }
ShipPositionManager >> movementEffectFor: aShip moving: sumOfDices inBoardOfSize: aBoardSize modifiedBy: aFutureBlock [

	^ (self statusOf: aShip)
		  movementEffectAfterMoving: sumOfDices
		  inBoardOfSize: aBoardSize
		  modifiedBy: aFutureBlock
]

{ #category : 'initialization' }
ShipPositionManager >> statusOf: aShip [

	^ shipStatuses detect: [ :aShipStatus | aShipStatus isFor: aShip ]
]

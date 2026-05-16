Class {
	#name : 'ShipRaceStatus',
	#superclass : 'Object',
	#instVars : [
		'ship',
		'boardPosition',
		'lap'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
ShipRaceStatus class >> for: aShip [

	^ self new initializeFor: aShip
]

{ #category : 'initialization' }
ShipRaceStatus >> advanceBy: anAmount inBoardOfSize: aBoardSize [

	| absolutePosition newAbsolutePosition |
	absolutePosition := lap * aBoardSize + boardPosition.

	newAbsolutePosition := absolutePosition + anAmount.

	newAbsolutePosition < 0 ifTrue: [ newAbsolutePosition := 0 ].

	lap := newAbsolutePosition // aBoardSize.
	boardPosition := newAbsolutePosition \\ aBoardSize
]

{ #category : 'initialization' }
ShipRaceStatus >> hasCompleted: lapsToWin [

	^ lap >= lapsToWin
]

{ #category : 'initialization' }
ShipRaceStatus >> initializeFor: aShip [

	ship := aShip.
	boardPosition := 0.
	lap := 0.
]

{ #category : 'initialization' }
ShipRaceStatus >> isAtLap: aLap [

	^ lap = aLap
]

{ #category : 'initialization' }
ShipRaceStatus >> isAtPosition: aPosition [

	^ boardPosition = aPosition
]

{ #category : 'testing' }
ShipRaceStatus >> isFor: aShip [

	^ ship = aShip
]

{ #category : 'as yet unclassified' }
ShipRaceStatus >> movementEffectAfterMoving: sumOfDices inBoardOfSize: aBoardSize modifiedBy: aFutureBlock [

	| futurePosition |
	futurePosition := boardPosition + sumOfDices \\ aBoardSize.

	^ aFutureBlock value: futurePosition
]

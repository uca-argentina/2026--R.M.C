Class {
	#name : 'ShipRaceStatus',
	#superclass : 'Object',
	#instVars : [
		'allShips',
		'currentIndexOfShipPlaying',
		'numberOfLaps',
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

	| totalPosition |

	totalPosition := boardPosition + anAmount.
	lap := lap + (totalPosition // aBoardSize).
	boardPosition := totalPosition \\ aBoardSize.
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
ShipRaceStatus >> movementAfterMoving: sumOfDices inBoardOfSize: aBoardSize modifiedBy: aFutureBlock [

	| futurePosition |

	futurePosition := (boardPosition + sumOfDices) \\ aBoardSize.

	^ aFutureBlock value: futurePosition
]

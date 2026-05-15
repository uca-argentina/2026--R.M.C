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
ShipRaceStatus >> goBackBy: anAmount inBoardOfSize: aBoardSize [

	| totalPosition |

	totalPosition := boardPosition - anAmount.

	[ totalPosition < 0 ] whileTrue: [
		totalPosition := totalPosition + aBoardSize.
		lap := lap - 1.
	].

	lap := lap max: 0.
	boardPosition := totalPosition.
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

{ #category : 'initialization' }
ShipRaceStatus >> isFor: aShip [

	^ ship = aShip
]

{ #category : 'initialization' }
ShipRaceStatus >> sendToStart [

	boardPosition := 0.
]

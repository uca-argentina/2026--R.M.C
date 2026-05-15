Class {
	#name : 'ChargedBoard',
	#superclass : 'Object',
	#instVars : [
		'totalNumberFaces',
		'cells',
		'shipsInCell',
		'numberOfCells'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
ChargedBoard class >> createWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	self validateNumber: aNumberOfCells.
	self validateCollection: aCollectionOfShips.

	^ self new
		  initializeWithATotalNumberOfCellsOf: aNumberOfCells
		  andShips: aCollectionOfShips
]

{ #category : 'as yet unclassified' }
ChargedBoard class >> validateCollection: aCollection [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be at least one ship in the board' ].

	aCollection asSet size ~= aCollection size ifTrue: [
		Error signal: 'There cant be two equals ships in the board' ]
]

{ #category : 'testing' }
ChargedBoard class >> validateNumber: aNumber [

	(aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
			Error signal:
				'The board must have an integer number of cells greater than two' ].
	^ aNumber
]

{ #category : 'testing' }
ChargedBoard >> canPlay [

	^ (cells last) hasShips.
]

{ #category : 'testing' }
ChargedBoard >> hasAmountOfShips: anAmountOfShips [

	^ shipsInCell size = anAmountOfShips
]

{ #category : 'testing' }
ChargedBoard >> hasTheShip: aShip atThePosition: aPosition [

	^ (cells at: aPosition +1) hasTheShip: aShip .
]

{ #category : 'initialization' }
ChargedBoard >> initializeWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	numberOfCells := aNumberOfCells.

	cells := (0 to: aNumberOfCells) collect: [ :index |
		         Cell createWithPosition: index ].
	
	aCollectionOfShips do: [ :aShip | cells first received: aShip ].

]

{ #category : 'as yet unclassified' }
ChargedBoard >> move: aShip by: amountToAdd in: aGame [

	| currentCell newPosition |

	currentCell := cells detect: [ :aCell | aCell hasTheShip: aShip ].

	newPosition := currentCell numberOfCell + amountToAdd.

	currentCell lose: aShip.
	(cells at: newPosition + 1) received: aShip.
	(cells at: newPosition + 1) effectTo: aShip in: aGame.

]

{ #category : 'as yet unclassified' }
ChargedBoard >> moveWithoutEffect: aShip by: amountToAdd [

	| currentCell newPosition |
	currentCell := cells detect: [ :aCell | aCell hasTheShip: aShip ].
	newPosition := currentCell numberOfCell + amountToAdd.
	currentCell lose: aShip.
	(cells at: newPosition + 1) received: aShip.

]

{ #category : 'accessing' }
ChargedBoard >> numberOfCells [

	^ numberOfCells
]

{ #category : 'as yet unclassified' }
ChargedBoard >> putThe: aEspecificCell at: aPosition [.

cells at: aPosition put: aEspecificCell .
]

{ #category : 'as yet unclassified' }
ChargedBoard >> winnerShip: aShip [

	^ self hasTheShip: aShip atThePosition: numberOfCells
]

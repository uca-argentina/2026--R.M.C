Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells',
		'cells'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	self validateNumber: aNumberOfCells.
	self validateCollection: aCollectionOfShips.

	^ self new
		  initializeWithATotalNumberOfCellsOf: aNumberOfCells
		  andShips: aCollectionOfShips
]

{ #category : 'as yet unclassified' }
Board class >> validateCollection: aCollection [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be at least one ship in the board' ].

	aCollection asSet size ~= aCollection size ifTrue: [
		Error signal: 'There cant be two equals ships in the board' ]
]

{ #category : 'testing' }
Board class >> validateNumber: aNumber [

	(aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
			Error signal:
				'The board must have an integer number of cells greater than two' ].
	^ aNumber
]

{ #category : 'testing' }
Board >> canPlay [

	^ (cells last) hasShips.
]

{ #category : 'testing' }
Board >> hasTheShip: aShip atThePosition: aPosition [

	^ (cells at: aPosition +1) hasTheShip: aShip .
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	numberOfCells := aNumberOfCells.

	cells := (0 to: aNumberOfCells) collect: [ :index |
		         Cell createWithPosition: index ].
	
	aCollectionOfShips do: [ :aShip | cells first received: aShip ].

]

{ #category : 'as yet unclassified' }
Board >> move: aShip by: amountToAdd [

	| currentCell newPosition |

	currentCell := cells detect: [ :aCell | aCell hasTheShip: aShip ].

	newPosition := currentCell numberOfCell + amountToAdd.

	currentCell lose: aShip.
	(cells at: newPosition + 1) received: aShip.
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [

	^ numberOfCells
]

{ #category : 'as yet unclassified' }
Board >> winnerShip: aShip [

	^ self hasTheShip: aShip atThePosition: numberOfCells
]

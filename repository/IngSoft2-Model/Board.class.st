Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells',
		'state',
		'ships',
		'shipsWhereabout'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells [

	^ self new initializeWithATotalNumberOfCellsOf:
		  (self validate: aNumberOfCells)
]

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells andShips: aShip [

	^ self new
		  initializeWithATotalNumberOfCellsOf: aNumberOfCells
		  andShips: aShip
]

{ #category : 'testing' }
Board class >> validate: aNumber [
    (aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
        Error signal: 'The board must have an integer number of cells greater than two'
    ].
	^aNumber.
]

{ #category : 'testing' }
Board >> actualState [

	^ state
]

{ #category : 'testing' }
Board >> hasTheShip: aShip [

	^ true
]

{ #category : 'testing' }
Board >> hasTheShip: aShip atThePosition: aPosition [

	^ (shipsWhereabout at: aShip) = aPosition
]

{ #category : 'initialization' }
Board >> initialize [

	super initialize.
	numberOfCells := 2.
	state := 'not finish'
	"Es un valor por default, para que si creo mi tablero con new lo haga de forma default"
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells [ 
	numberOfCells := aNumberOfCells.
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells andShips: aShip [

	numberOfCells := aNumberOfCells.
	ships := aShip.
	shipsWhereabout := Dictionary new.
	shipsWhereabout at: aShip put: 0
]

{ #category : 'as yet unclassified' }
Board >> move: aShip by: cellToMove [

	shipsWhereabout at: aShip put: cellToMove
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [
	^ numberOfCells .
]

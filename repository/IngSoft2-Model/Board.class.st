Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells',
		'shipsWhereabout'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	self validate: aNumberOfCells .

	^ self new
		  initializeWithATotalNumberOfCellsOf: aNumberOfCells
		  andShips: aCollectionOfShips
]

{ #category : 'testing' }
Board class >> validate: aNumber [
    (aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
        Error signal: 'The board must have an integer number of cells greater than two'
    ].
	^aNumber.
]

{ #category : 'testing' }
Board >> hasTheShip: aShip atThePosition: aPosition [

	^ (shipsWhereabout at: aShip) = aPosition
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells andShips: aCollectionOfShips [

	numberOfCells := aNumberOfCells.

	shipsWhereabout := Dictionary new.
	aCollectionOfShips do: [ :aShip | shipsWhereabout at: aShip put: 0 ]
]

{ #category : 'as yet unclassified' }
Board >> move: aShip by: cellToMove [

	shipsWhereabout at: aShip put: cellToMove
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [
	^ numberOfCells .
]

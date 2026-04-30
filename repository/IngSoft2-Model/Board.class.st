Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells [

	^ self new initializeWithATotalNumberOfCellsOf:
		  (self validate: aNumberOfCells)
]

{ #category : 'testing' }
Board class >> validate: aNumber [
    (aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
        Error signal: 'The board must have an integer number of cells greater than two'
    ].
	^aNumber.
]

{ #category : 'initialization' }
Board >> initialize [

	super initialize.
	numberOfCells := 2
	"Es un valor por default, para que si creo mi tablero con new lo haga de forma default"
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells [ 
	numberOfCells := aNumberOfCells.
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [
	^ numberOfCells .
]

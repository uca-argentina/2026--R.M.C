Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells',
		'cells',
		'amountOfParcecs'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells andAnAmountOfParcecsOf: anAmountOfParcecs [ 
	self validateNumber: aNumberOfCells .
	self validateParcecs: anAmountOfParcecs .
	^ self new initializeWithATotalNumberOfCellsOf: aNumberOfCells andAnAmountOfParcecsOf: anAmountOfParcecs .
]

{ #category : 'testing' }
Board class >> validateNumber: aNumber [

	(aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
			Error signal:
				'The board must have an integer number of cells greater than two' ].
	^ aNumber
]

{ #category : 'testing' }
Board class >> validateParcecs: aNumber [

	(aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
			Error signal:
				'The board must have an positive integer number of parcecs' ].
	^ aNumber
]

{ #category : 'as yet unclassified' }
Board >> amountOfCellsForParsecs: anAmountOfParsecs [

	^ anAmountOfParsecs // (amountOfParcecs / self numberOfCells)
]

{ #category : 'accessing' }
Board >> effectForLandingAt: aPosition startingWith: anAmount [

	| cell |
	cell := cells at: aPosition + 1.

	^ cell effectForMovement: anAmount in: self.
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells andAnAmountOfParcecsOf:anAmountOfParcecs [ 
	 numberOfCells  := aNumberOfCells.
		cells := (0 to: aNumberOfCells) collect: [ :index |
		         Cell createWithPosition: index ].
	 amountOfParcecs := anAmountOfParcecs.
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [

	^ numberOfCells
]

{ #category : 'as yet unclassified' }
Board >> parcecs [
^ amountOfParcecs .
]

Class {
	#name : 'ChargedCellGenerator',
	#superclass : 'CellGenerator',
	#instVars : [
		'chargedCells',
		'numberOfCells'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ChargedCellGenerator class >> forBoardOfSize: aNumberOfCells [

	^ self new initializeForBoardOfSize: aNumberOfCells
]

{ #category : 'as yet unclassified' }
ChargedCellGenerator >> cellForPosition: aPosition [

	self validatePosition: aPosition.

	^ chargedCells
		  at: aPosition
		  ifAbsent: [ Cell createWithPosition: aPosition ]
]

{ #category : 'initialization' }
ChargedCellGenerator >> initializeForBoardOfSize: aNumberOfCells [

	numberOfCells := aNumberOfCells.
	chargedCells := Dictionary new
]

{ #category : 'as yet unclassified' }
ChargedCellGenerator >> put: aCell at: aPosition [

	self validatePosition: aPosition.

	chargedCells at: aPosition put: aCell
]

{ #category : 'as yet unclassified' }
ChargedCellGenerator >> validatePosition: aPosition [

	((aPosition < 0) or: [ aPosition > numberOfCells ]) ifTrue: [
		Error signal: 'Invalid cell position' ]
]

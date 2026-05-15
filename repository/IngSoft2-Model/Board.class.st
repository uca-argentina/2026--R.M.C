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
Board class >> createWithATotalNumberOfCellsOf: aNumberOfCells [. 

	self validateNumber: aNumberOfCells.
	

	^ self new
		  initializeWithATotalNumberOfCellsOf: aNumberOfCells.
]

{ #category : 'testing' }
Board class >> validateNumber: aNumber [

	(aNumber isInteger and: [ aNumber > 2 ]) ifFalse: [
			Error signal:
				'The board must have an integer number of cells greater than two' ].
	^ aNumber
]

{ #category : 'initialization' }
Board >> initializeWithATotalNumberOfCellsOf: aNumberOfCells [ 

	numberOfCells := aNumberOfCells.

	cells := (0 to: aNumberOfCells) collect: [ :index |
		         Cell createWithPosition: index ].
	

]

{ #category : 'accessing' }
Board >> modifyMovementForLandingAt: aPosition startingWith: anAmount [

	| cell |

	cell := cells at: aPosition + 1.

	^ cell modifyMovement: anAmount
]

{ #category : 'as yet unclassified' }
Board >> numberOfCells [

	^ numberOfCells
]

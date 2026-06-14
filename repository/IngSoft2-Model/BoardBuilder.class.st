Class {
	#name : 'BoardBuilder',
	#superclass : 'Object',
	#instVars : [
		'numberOfCells',
		'amountOfParcecs',
		'cellGenerator'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardBuilder class >> withCells: aNumberOfCells andParcecs: anAmountOfParcecs [

	^ self new initializeWithCells: aNumberOfCells andParcecs: anAmountOfParcecs
]

{ #category : 'initialization' }
BoardBuilder >> build [

	^ Board
		  createWithATotalNumberOfCellsOf: numberOfCells
		  andAnAmountOfParcecsOf: amountOfParcecs
		  using: cellGenerator
]

{ #category : 'initialization' }
BoardBuilder >> initializeWithCells: aNumberOfCells andParcecs: anAmountOfParcecs [

	numberOfCells := aNumberOfCells.
	amountOfParcecs := anAmountOfParcecs.
	cellGenerator := ChargedCellGenerator forBoardOfSize: aNumberOfCells
]

{ #category : 'initialization' }
BoardBuilder >> putting: aCell at: aPosition [

	| generator |

	generator := ChargedCellGenerator forBoardOfSize: numberOfCells.
	generator put: aCell at: aPosition.

	cellGenerator := generator
]

{ #category : 'initialization' }
BoardBuilder >> using: aCellGenerator [

	cellGenerator := aCellGenerator
]

{ #category : 'initialization' }
BoardBuilder >> usingRandomCells [

	| random distribution |

	random := Random new.
	distribution := CellProbabilityDistribution defaultFor: random.

	cellGenerator := RandomCellGenerator
		                 using: distribution
		                 andRandom: random
]

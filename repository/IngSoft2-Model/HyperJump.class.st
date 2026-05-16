Class {
	#name : 'HyperJump',
	#superclass : 'Cell',
	#instVars : [
		'parsecValues',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> createWithPosition: aPosition andParsecs: aCollectionOfParsecs [

	^ self new initializeWithPosition: aPosition andParsecs: aCollectionOfParsecs
]

{ #category : 'as yet unclassified' }
HyperJump >> effectForMovement: anAmount in: aBoard [

	| parsecs cellsToAdvance |

	parsecs := self nextParsecs.
	cellsToAdvance := aBoard amountOfCellsForParsecs: parsecs.

	^ MovementEffectManager moveOneShipBy: anAmount + cellsToAdvance
]

{ #category : 'initialization' }
HyperJump >> initializeWithPosition: aPosition andParsecs: aCollectionOfParsecs [

	position := aPosition.
	parsecValues := aCollectionOfParsecs asSortedCollection: [ :a :b | a > b ].
	currentIndex := 1.
]

{ #category : 'as yet unclassified' }
HyperJump >> nextParsecs [

	| parsecs |

	parsecs := parsecValues at: currentIndex.

	currentIndex := currentIndex + 1.
	currentIndex > parsecValues size ifTrue: [
		currentIndex := 1
	].

	^ parsecs
]

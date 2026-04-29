Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'totalNumberFaces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Dice class >> cannotBeLowerThan: amountOfFaces [

	amountOfFaces < 3 ifTrue: [
		Error signal: 'Number of faces cannot be lower that two' ]
]

{ #category : 'accessing' }
Dice class >> default [

	^ self withTotalNumberFaces: 6
]

{ #category : 'as yet unclassified' }
Dice class >> withTotalNumberFaces: amountOfFaces [

	self cannotBeLowerThan: amountOfFaces.
	^ self new initializeWith: amountOfFaces
]

{ #category : 'initialization' }
Dice >> initializeWith: amountOfFaces [

	totalNumberFaces := amountOfFaces
]

{ #category : 'as yet unclassified' }
Dice >> throw [

	^ (1 to: totalNumberFaces) atRandom
]

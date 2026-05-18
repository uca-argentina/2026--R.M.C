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

	(amountOfFaces isInteger and: [ amountOfFaces > 2 ]) ifFalse: [
			Error signal:
				'Number of faces cannot be lower that two (must be integer)' ]
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

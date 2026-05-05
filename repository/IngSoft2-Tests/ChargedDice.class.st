Class {
	#name : 'ChargedDice',
	#superclass : 'Object',
	#instVars : [
		'totalNumberFaces'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
ChargedDice class >> cannotBeLowerThan: amountOfFaces [

	amountOfFaces < 3 ifTrue: [
		Error signal: 'Number of faces cannot be lower that two' ]
]

{ #category : 'accessing' }
ChargedDice class >> default [

	^ self withTotalNumberFaces: 6
]

{ #category : 'as yet unclassified' }
ChargedDice class >> withTotalNumberFaces: amountOfFaces [

	self cannotBeLowerThan: amountOfFaces.
	^ self new initializeWith: amountOfFaces
]

{ #category : 'initialization' }
ChargedDice >> initializeWith: amountOfFaces [

	totalNumberFaces := amountOfFaces
]

{ #category : 'as yet unclassified' }
ChargedDice >> throw [

	^  totalNumberFaces.
]

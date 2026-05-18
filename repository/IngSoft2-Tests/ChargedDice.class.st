Class {
	#name : 'ChargedDice',
	#superclass : 'Object',
	#instVars : [
		'listOfValues',
		'indexOfList'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
ChargedDice class >> withTotalNumberFaces: listOfValues [

	^ self new initializeWith: listOfValues 
]

{ #category : 'initialization' }
ChargedDice >> initializeWith: aListOfValues [

	listOfValues := aListOfValues .
	indexOfList := 1.
]

{ #category : 'as yet unclassified' }
ChargedDice >> throw [

	| value |
	value := listOfValues at: indexOfList .

	indexOfList := indexOfList + 1.

	indexOfList > listOfValues size ifTrue: [ indexOfList := 1 ].

	^ value
]

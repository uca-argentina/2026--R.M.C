Class {
	#name : 'ChargedDeck',
	#superclass : 'Object',
	#instVars : [
		'card'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'instance creation' }
ChargedDeck class >> with: aCard [

	^ self new initializeWith: aCard
]

{ #category : 'as yet unclassified' }
ChargedDeck >> initializeWith: aCard [

	card := aCard
]

{ #category : 'as yet unclassified' }
ChargedDeck >> nextCard [

	^ card
]

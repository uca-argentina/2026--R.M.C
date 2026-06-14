Class {
	#name : 'Deck',
	#superclass : 'Object',
	#instVars : [
		'random',
		'cardClasses'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Deck class >> using: aRandom andCardClasses: aCollectionOfCardClasses [

	^ self new initializeWithRandom: aRandom andCardClasses: aCollectionOfCardClasses
]

{ #category : 'as yet unclassified' }
Deck >> initializeWithRandom: aRandom andCardClasses: aCollectionOfCardClasses [

	random := aRandom.
	cardClasses := aCollectionOfCardClasses
]

{ #category : 'as yet unclassified' }
Deck >> nextCard [

	| index |
	index := random nextInteger: cardClasses size.
	^ (cardClasses at: index) new
]

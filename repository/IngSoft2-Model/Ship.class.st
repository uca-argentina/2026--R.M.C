Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'card'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWithName: anName [

	self validate: anName.
	^ self new initializeWith: anName
]

{ #category : 'as yet unclassified' }
Ship class >> createWithName: aName andWithCard: aCard [

	^ self new intializeWith: aName andWithCard: aCard copy
]

{ #category : 'as yet unclassified' }
Ship class >> validate: aName [

	aName isString ifFalse: [ Error signal: 'The name must be a string' ]
]

{ #category : 'testing' }
Ship >> hasCardLeft [

	^ card size
]

{ #category : 'initialization' }
Ship >> initializeWith: anName [

	name := anName
]

{ #category : 'as yet unclassified' }
Ship >> intializeWith: aName andWithCard: aCard [

	name := aName.
	card := aCard
]

{ #category : 'accessing' }
Ship >> name [

	^ name
]

{ #category : 'as yet unclassified' }
Ship >> nameIs: aName [

	^ name == aName
]

{ #category : 'as yet unclassified' }
Ship >> playsCardFromGame: aGame LookForCardInShip: aCard [

	| aShipHasCard |
	aShipHasCard := card includes: aCard.
	aShipHasCard ifTrue: [ card remove: aCard. aGame appliesCard: aCard ]
		ifFalse: [ Error signal: 'Ship does not have that card' ]
]

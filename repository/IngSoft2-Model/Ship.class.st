Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name',
		'cards'
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
Ship class >> createWithName: aName andWithCard: aCollectionOfCards [

	self validate: aName.
	^ self new
		intializeWith: aName
		andWithCard: aCollectionOfCards
]

{ #category : 'as yet unclassified' }
Ship class >> validate: aName [

	aName isString ifFalse: [ Error signal: 'The name must be a string' ]
]

{ #category : 'as yet unclassified' }
Ship >> PlaysCardFromGame: aGame LookForCardinShip: aCard [

	self removeCard: aCard.
	aGame appliesCard: aCard.
]

{ #category : 'as yet unclassified' }
Ship >> addCard: aCard [

	cards add: aCard.
]

{ #category : 'as yet unclassified' }
Ship >> cards [

	^ cards copy
]

{ #category : 'as yet unclassified' }
Ship >> hasCardLeft [

	^ cards size
]

{ #category : 'initialization' }
Ship >> initializeWith: aName [

	name := aName.
	cards := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Ship >> intializeWith: aName andWithCard: aCollectionOfCards [

	name := aName.
	cards := aCollectionOfCards copy.
]

{ #category : 'accessing' }
Ship >> name [
	 ^name
]

{ #category : 'as yet unclassified' }
Ship >> nameIs: aName [

	^ name == aName
]

{ #category : 'as yet unclassified' }
Ship >> removeCard: aCard [

	(cards includes: aCard)
		ifFalse: [ Error signal: 'The ship does not have that card' ].

	cards remove: aCard.
]

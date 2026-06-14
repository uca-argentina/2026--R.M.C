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
Ship class >> createWithName: aName andWithACollectionOfCards: aCollectionOfCards [

	self validateName: aName.
	self validateCollectionOfCards: aCollectionOfCards.
	^ self new intializeWithName: aName andWithACollectionOfCards: aCollectionOfCards copy
]

{ #category : 'as yet unclassified' }
Ship class >> validateCollectionOfCards: aCollectionOfCards [

	aCollectionOfCards ifEmpty: [ Error signal: 'The collection of cards cannot be empty' ]
]

{ #category : 'as yet unclassified' }
Ship class >> validateName: aName [

	(aName isString) ifFalse: [ Error signal: 'The name must be a string' ]
]

{ #category : 'as yet unclassified' }
Ship >> addCard: aCard [

	cards add: aCard
]

{ #category : 'as yet unclassified' }
Ship >> cards [

	^ cards copy
]

{ #category : 'as yet unclassified' }
Ship >> hasCardLeft [

	^ cards size
]

{ #category : 'testing' }
Ship >> hasCardsLeft [

	^ cards size
]

{ #category : 'initialization' }
Ship >> initializeWith: aName [

	name := aName.
	cards := OrderedCollection new
]

{ #category : 'as yet unclassified' }
Ship >> intializeWithName: aName andWithACollectionOfCards: aCollectionOfCards [

	name := aName.
	cards := aCollectionOfCards
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
Ship >> playsCardFromGame: aGame lookForCardInShip: aCard [

	| aShipHasCard |
	aShipHasCard := cards includes: aCard.
	aShipHasCard ifTrue: [ cards remove: aCard. aGame appliesCard: aCard ]
		ifFalse: [ Error signal: 'Ship does not have that card' ]
]

{ #category : 'as yet unclassified' }
Ship >> removeCard: aCard [

	(cards includes: aCard) ifFalse: [ Error signal: 'The ship does not have that card' ].
	cards remove: aCard
]

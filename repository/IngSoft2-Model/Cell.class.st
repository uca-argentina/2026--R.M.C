Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'position',
		'shipsInCell'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cell class >> createWithPosition: aPosition [

	self verificate: aPosition.
	^ self new initializeWithPosition: aPosition
]

{ #category : 'as yet unclassified' }
Cell class >> verificate: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ]) ifFalse: [
			Error signal:
				'Position cannot be negative (must be integer)' ]
]

{ #category : 'testing' }
Cell >> hasAmountOfShips: anAmountOfShips [

	^ shipsInCell size = anAmountOfShips
]

{ #category : 'testing' }
Cell >> hasShips [

 ^(shipsInCell size > 0) 
]

{ #category : 'testing' }
Cell >> hasTheShip: aShip [

^ shipsInCell includes: aShip .
]

{ #category : 'initialization' }
Cell >> initializeWithPosition: aPosition [

	position := aPosition.
	shipsInCell := OrderedCollection new
]

{ #category : 'testing' }
Cell >> lose: aShip [

	shipsInCell remove: aShip
]

{ #category : 'as yet unclassified' }
Cell >> numberOfCell [

	^ position
]

{ #category : 'testing' }
Cell >> received: aShip [

	shipsInCell add: aShip
]

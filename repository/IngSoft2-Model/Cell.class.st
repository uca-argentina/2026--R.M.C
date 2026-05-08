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

	^ self new initializeWithPosition: aPosition
]

{ #category : 'testing' }
Cell >> hasAmountOfShips: anAmountOfShips [

	^ shipsInCell size = anAmountOfShips
]

{ #category : 'testing' }
Cell >> hasLost: aShip [

	shipsInCell remove: aShip
]

{ #category : 'testing' }
Cell >> hasReceived: aShip [

	shipsInCell add: aShip
]

{ #category : 'initialization' }
Cell >> initializeWithPosition: aPosition [

	position := aPosition.
	shipsInCell := OrderedCollection new
]

{ #category : 'accessing' }
Cell >> isAt: anInteger [

	^ position = anInteger
]

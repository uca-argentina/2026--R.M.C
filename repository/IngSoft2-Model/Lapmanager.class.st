Class {
	#name : 'Lapmanager',
	#superclass : 'Object',
	#instVars : [
		'allShips',
		'currentIndexOfShipPlaying'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Lapmanager class >> CreatWith: aCollectionOfShip [ 
	^self new initializeWith:aCollectionOfShip.
]

{ #category : 'as yet unclassified' }
Lapmanager >> Lap [
	^0.
]

{ #category : 'initialization' }
Lapmanager >> initializeWith: aCollectionOfShips [ 
	allShips:=aCollectionOfShips.
	currentIndexOfShipPlaying:=0.
]

{ #category : 'initialization' }
Lapmanager >> nextShipToPlay [

	| ship |
	ship := allShips at: currentIndexOfShipPlaying + 1.

	currentIndexOfShipPlaying := currentIndexOfShipPlaying + 1
	                             \\ allShips size.

	^ ship
]

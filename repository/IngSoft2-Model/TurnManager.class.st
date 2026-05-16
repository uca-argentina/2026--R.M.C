Class {
	#name : 'TurnManager',
	#superclass : 'Object',
	#instVars : [
		'allships',
		'currentIndexOfShipPlaying'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
TurnManager class >> creatWith: aCollectionofShips [ 
	^self new intializeWith:aCollectionofShips.
]

{ #category : 'as yet unclassified' }
TurnManager >> intializeWith: aCollectionofShips [
	allships:=aCollectionofShips .
	currentIndexOfShipPlaying:=0.
]

{ #category : 'as yet unclassified' }
TurnManager >> nextShipToPlayInGame [
| ship  |
	ship := allships at: currentIndexOfShipPlaying + 1.

	currentIndexOfShipPlaying := currentIndexOfShipPlaying + 1
	                             \\ allships size.

	^ ship
]

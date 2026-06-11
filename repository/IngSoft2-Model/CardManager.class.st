Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'aCard'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardManager class >> createWith: alistofCards [
	^self new intializeWith:alistofCards .
]

{ #category : 'as yet unclassified' }
CardManager >> applyCard: aCard fromShip: aShip to: aShip3 [ 
	aCard applyPenaltyTo:aShip3 .
]

{ #category : 'as yet unclassified' }
CardManager >> intializeWith: aSobreCarga [ 
	aCard=aSobreCarga.
]

Class {
	#name : 'SobreCarga',
	#superclass : 'Object',
	#instVars : [
		'aListofShipToPenalize'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SobreCarga >> applyPenaltyTo: aShip [ 
	aListofShipToPenalize add:aShip.
]

{ #category : 'as yet unclassified' }
SobreCarga >> nameIs: aCardName [ 
	^aCardName ='SobreCarga'.
]

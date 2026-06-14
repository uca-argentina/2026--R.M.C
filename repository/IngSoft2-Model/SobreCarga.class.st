Class {
	#name : 'SobreCarga',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
SobreCarga >> applyIn: aCardManager toTarget: aShip [

	aCardManager addPenalty: self toTarget: aShip
]

{ #category : 'as yet unclassified' }
SobreCarga >> throwModifier [

	^ -2
]

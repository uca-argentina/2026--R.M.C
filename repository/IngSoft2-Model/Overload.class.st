Class {
	#name : 'Overload',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Overload >> applyIn: aCardManager toTarget: aShip [

	aCardManager addPenalty: self toTarget: aShip
]

{ #category : 'as yet unclassified' }
Overload >> throwModifier [

	^ -2
]

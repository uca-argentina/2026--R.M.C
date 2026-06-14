Class {
	#name : 'Redo',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Redo >> applyIn: aCardManager toTarget: aShip [

	| cardToRepeat |
	cardToRepeat := aCardManager lastCard.
	cardToRepeat applyIn: aCardManager toTarget: aShip
]

{ #category : 'initialization' }
Redo >> throwModifier [

	^ 0
]

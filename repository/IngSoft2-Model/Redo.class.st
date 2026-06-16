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
	(cardToRepeat = 'no cards') ifTrue: [ Error signal: 'The redo must be played after another card' ].
	cardToRepeat applyIn: aCardManager toTarget: aShip
]

{ #category : 'testing' }
Redo >> isRedo [

	^ true
]

{ #category : 'initialization' }
Redo >> throwModifier [

	^ 0
]

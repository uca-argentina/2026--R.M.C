Class {
	#name : 'Cancellation',
	#superclass : 'Card',
	#instVars : [
		'cardToCancel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Cancellation >> applyIn: aCardManager toTarget: aShip [

	cardToCancel ifNil: [Error signal: 'The cancellation must have a target card to cancel' ].
	aCardManager cancelCard: cardToCancel toTarget: aShip.
]

{ #category : 'as yet unclassified' }
Cancellation >> targeting: aCard [

	cardToCancel := aCard
]

{ #category : 'initialization' }
Cancellation >> throwModifier [

	^ 0
]

Class {
	#name : 'Cancellation',
	#superclass : 'Card',
	#instVars : [
		'cardToCancel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancellation class >> targeting: aCard [

	^ self new initializeTargeting: aCard
]

{ #category : 'initialization' }
Cancellation >> applyIn: aCardManager toTarget: aShip [

	aCardManager cancelCard: cardToCancel toTarget: aShip
]

{ #category : 'initialization' }
Cancellation >> initializeTargeting: aCard [

	cardToCancel := aCard
]

{ #category : 'initialization' }
Cancellation >> throwModifier [

	^ 0
]

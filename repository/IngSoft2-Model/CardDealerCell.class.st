Class {
	#name : 'CardDealerCell',
	#superclass : 'Cell',
	#instVars : [
		'cardGenerator'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardDealerCell class >> createWithPosition: aPosition andCardGenerator: aCardGenerator [

	self verificate: aPosition.
	^ self new
		  initializeWithPosition: aPosition
		  andCardGenerator: aCardGenerator
]

{ #category : 'as yet unclassified' }
CardDealerCell >> effectForMovement: anAmount in: aBoard [

	^ CardDealerMovementEffect
		  moving: anAmount
		  andGivingCardFrom: cardGenerator
]

{ #category : 'as yet unclassified' }
CardDealerCell >> initializeWithPosition: aPosition andCardGenerator: aCardGenerator [

	position := aPosition.
	cardGenerator := aCardGenerator
]

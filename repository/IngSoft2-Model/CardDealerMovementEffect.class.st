Class {
	#name : 'CardDealerMovementEffect',
	#superclass : 'Object',
	#instVars : [
		'amount',
		'cardGenerator'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardDealerMovementEffect class >> moving: anAmount andGivingCardFrom: aCardGenerator [

	^ self new
		  initializeMoving: anAmount
		  andGivingCardFrom: aCardGenerator
]

{ #category : 'as yet unclassified' }
CardDealerMovementEffect >> applyTo: aShip in: aGame [

	aGame move: aShip by: amount.
	aShip addCard: cardGenerator nextCard
]

{ #category : 'as yet unclassified' }
CardDealerMovementEffect >> initializeMoving: anAmount andGivingCardFrom: aCardGenerator [

	amount := anAmount.
	cardGenerator := aCardGenerator
]

Class {
	#name : 'MoonWalk',
	#superclass : 'Cell',
	#instVars : [
		'amountOfBackwardCells'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> createWithPosition: aPositionInBoard withBackwardsMovementOf: amountOfBackwardCells [ 
	self verificate: amountOfBackwardCells .
	^self new initializeWithPosition: aPositionInBoard withBackwardsMovementOf: amountOfBackwardCells
]

{ #category : 'as yet unclassified' }
MoonWalk class >> verificate: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ]) ifFalse: [
			Error signal:
				'The backwards movement must be positive integer' ]
]

{ #category : 'as yet unclassified' }
MoonWalk >> effectForMovement: anAmount [

	^ MovementEffectManager
		  moveOneShipBy: anAmount
		  andMoveAllShipsExceptOneBackBy: amountOfBackwardCells
]

{ #category : 'initialization' }
MoonWalk >> initializeWithPosition: aPosition withBackwardsMovementOf: anAmountOfBackwardCells [

	position := aPosition.
	amountOfBackwardCells := anAmountOfBackwardCells negated
]

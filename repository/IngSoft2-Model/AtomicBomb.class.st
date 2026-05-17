Class {
	#name : 'AtomicBomb',
	#superclass : 'Cell',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AtomicBomb class >> createWithPosition: aPosition [ 
	^ self new initializeWithPosition: aPosition.
]

{ #category : 'as yet unclassified' }
AtomicBomb >> effectForMovement: anAmount in: aBoard [

	^ MovementEffectManager moveAllShipsBackToZero
]

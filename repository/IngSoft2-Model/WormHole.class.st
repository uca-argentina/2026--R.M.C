Class {
	#name : 'WormHole',
	#superclass : 'Cell',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'api' }
WormHole class >> createWithPosition: aPosition [ 
	^ self new  initializeWithPosition: aPosition.
]

{ #category : 'as yet unclassified' }
WormHole >> effectForMovement: anAmount in: aBoard [

	^ MovementEffectManager moveOneShipBy: anAmount - 4
]

Class {
	#name : 'WhromHole',
	#superclass : 'Cell',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'api' }
WhromHole class >> createWithPosition: aPosition [ 
	^ self new  initializeWithPosition: aPosition.
]

{ #category : 'as yet unclassified' }
WhromHole >> effectForMovement: anAmount [

	^ MovementEffectManager moveOneShipBy: anAmount - 4
]

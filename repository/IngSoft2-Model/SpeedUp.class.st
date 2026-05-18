Class {
	#name : 'SpeedUp',
	#superclass : 'Cell',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SpeedUp class >> createWithPosition: aPosition [ 
	^ self new initializeWithPosition: aPosition.
]

{ #category : 'as yet unclassified' }
SpeedUp >> effectForMovement: anAmount in: aBoard [

	^ MovementEffectManager moveOneShipBy: anAmount + 4
]

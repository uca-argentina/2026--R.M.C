Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cell class >> createWithPosition: aPosition [

	self verificate: aPosition.
	^ self new initializeWithPosition: aPosition
]

{ #category : 'as yet unclassified' }
Cell class >> verificate: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ]) ifFalse: [
			Error signal:
				'Position cannot be negative (must be integer)' ]
]

{ #category : 'as yet unclassified' }
Cell >> effectForMovement: anAmount [

	^ MovementEffectManager moveOneShipBy: anAmount
]

{ #category : 'initialization' }
Cell >> initializeWithPosition: aPosition [

	position := aPosition.
]

{ #category : 'as yet unclassified' }
Cell >> numberOfCell [

	^ position
]

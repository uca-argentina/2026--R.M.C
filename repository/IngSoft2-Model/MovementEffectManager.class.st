Class {
	#name : 'MovementEffectManager',
	#superclass : 'Object',
	#instVars : [
		'action'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MovementEffectManager class >> moveAllShipsBackToZero [

	^ self new initializeWith: [ :aShip :aGame |
		  aGame moveBackToZero: aShip ]
]

{ #category : 'as yet unclassified' }
MovementEffectManager class >> moveOneShipBy: anAmount [

	^ self new initializeWith: [ :aShip :aGame |
		  aGame move: aShip by: anAmount ]
]

{ #category : 'as yet unclassified' }
MovementEffectManager class >> moveOneShipBy: movementAmount andMoveAllShipsExceptOneBackBy: backwardAmount [

	^ self new initializeWith: [ :aShip :aGame |
			  aGame move: aShip by: movementAmount.
			  aGame moveAllShipsExcept: aShip by: backwardAmount ]
]

{ #category : 'as yet unclassified' }
MovementEffectManager >> applyTo: aShip in: aGame [

	action value: aShip value: aGame
]

{ #category : 'initialization' }
MovementEffectManager >> initializeWith: aBlock [

	action := aBlock
]

Class {
	#name : 'Repeat',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Repeat >> applyIn: aCardManager toTarget: aShip [

	aCardManager repeatLastMovementEffect
]

{ #category : 'initialization' }
Repeat >> throwModifier [

	^ 0
]

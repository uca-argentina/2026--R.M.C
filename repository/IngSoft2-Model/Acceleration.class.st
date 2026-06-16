Class {
	#name : 'Acceleration',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Acceleration >> applyIn: aCardManager toTarget: aShip [

	aCardManager addPenaltyToAllShips: self
]

{ #category : 'initialization' }
Acceleration >> throwModifier [

	^ 1
]

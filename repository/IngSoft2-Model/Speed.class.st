Class {
	#name : 'Speed',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Speed >> applyIn: aCardManager toTarget: aShip [
    aCardManager addPenalty: self toTarget: aShip.
]

{ #category : 'as yet unclassified' }
Speed >> throwModifier [
	^1.
]

Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'pendingCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
CardManager >> addPenalty: aCard toTarget: aShip [
    pendingCards add: { aShip. aCard }.
]

{ #category : 'initialization' }
CardManager >> addPenaltyToAllShips: aCard [
    pendingCards add: { #all. aCard }.
]

{ #category : 'initialization' }
CardManager >> applyCard: aCard toTarget: aTargetShip [
    aCard applyIn: self toTarget: aTargetShip
]

{ #category : 'initialization' }
CardManager >> cancelCard: aCard toTarget: aShip [
    | entryToRemove |
    entryToRemove := pendingCards
        detect: [ :each | each second = aCard and: [ each first = aShip ] ]
        ifNone: [ ^self ].
    pendingCards remove: entryToRemove.
]

{ #category : 'initialization' }
CardManager >> initialize [
    pendingCards := OrderedCollection new.

]

{ #category : 'initialization' }
CardManager >> penaltyFor: aShip [
    | applicable |
    applicable := pendingCards select: [ :each | 
        each first = #all or: [ each first = aShip ] ].
    applicable isEmpty ifTrue: [ ^0 ].
    ^ applicable inject: 0 into: [ :sum :each | sum + each second throwModifier ].
]

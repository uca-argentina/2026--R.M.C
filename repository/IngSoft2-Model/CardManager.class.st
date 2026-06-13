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
CardManager >> applyCard: aCard toTarget: aTargetShip [
    aCard affectsAllShips
        ifTrue:  [ pendingCards add: { #all. aCard } ]
        ifFalse: [ pendingCards add: { aTargetShip. aCard } ]

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

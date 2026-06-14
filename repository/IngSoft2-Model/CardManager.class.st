Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'pendingCards',
		'lastPlayedCard',
		'lastMovementEffect',
		'movementEffectGeneratedByCard',
		'repeatedMovementEffect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
CardManager >> addPenalty: aCard toTarget: aShip [

	pendingCards add: { aShip. aCard }
]

{ #category : 'initialization' }
CardManager >> addPenaltyToAllShips: aCard [

	pendingCards add: { #all. aCard }
]

{ #category : 'initialization' }
CardManager >> applyCard: aCard toTarget: aTargetShip [

	movementEffectGeneratedByCard := nil.
	aCard applyIn: self toTarget: aTargetShip.
	self updateLastCard: aCard.
	^ movementEffectGeneratedByCard
]

{ #category : 'initialization' }
CardManager >> cancelCard: aCard toTarget: aShip [

	| entryToRemove |
	entryToRemove := pendingCards detect: [ :each | each second = aCard and: [ each first = aShip or: [ each first = #all ] ] ]
		                 ifNone: [ ^ self ].
	pendingCards remove: entryToRemove
]

{ #category : 'accessing' }
CardManager >> clearRepeatedMovementEffect [

	repeatedMovementEffect := nil
]

{ #category : 'initialization' }
CardManager >> initialize [

	pendingCards := OrderedCollection new.
	lastPlayedCard := 'no cards'
]

{ #category : 'as yet unclassified' }
CardManager >> lastCard [

	^ lastPlayedCard
]

{ #category : 'as yet unclassified' }
CardManager >> movementEffectGeneratedByCard [

	^ movementEffectGeneratedByCard
]

{ #category : 'initialization' }
CardManager >> penaltyFor: aShip [

	| applicable |
	applicable := pendingCards select: [ :each | each first = #all or: [ each first = aShip ] ].
	applicable isEmpty ifTrue: [ ^ 0 ].
	^ applicable inject: 0 into: [ :sum :each | sum + each second throwModifier ]
]

{ #category : 'as yet unclassified' }
CardManager >> repeatLastMovementEffect [

	repeatedMovementEffect := lastMovementEffect
]

{ #category : 'accessing' }
CardManager >> repeatedMovementEffect [

	^ repeatedMovementEffect
]

{ #category : 'as yet unclassified' }
CardManager >> updateLastCard: aCard [

	aCard isRedo ifFalse: [ lastPlayedCard := aCard ]
]

{ #category : 'as yet unclassified' }
CardManager >> updateLastMovementEffect: aMovementEffect [

	lastMovementEffect := aMovementEffect
]

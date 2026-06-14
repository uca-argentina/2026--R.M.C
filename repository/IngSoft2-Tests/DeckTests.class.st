Class {
	#name : 'DeckTests',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'aCollectionOfShips',
		'aBoard'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DeckTests >> test01DeckGeneratesAValidCard [

	| aDeck aCard |
	aDeck := Deck using: Random new andCardClasses: {
			         Speed.
			         Overload.
			         Acceleration.
			         Cancellation.
			         Redo.
			         Repeat }.

	aCard := aDeck nextCard.

	self assert: aCard isNotNil.

	self assert: ({
			 Speed.
			 Overload.
			 Acceleration.
			 Cancellation.
			 Redo.
			 Repeat } anySatisfy: [ :aClass | aCard isKindOf: aClass ])
]

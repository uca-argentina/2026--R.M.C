Class {
	#name : 'CellTestWormHole',
	#superclass : 'CellTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTestWormHole >> test01WhenTheWhormHoleIsCreatedThenItKnowsItsPosition [

	aCell := WormHole createWithPosition: 1.

	self assert: (aCell numberOfCell) equals: 1
]

{ #category : 'tests' }
CellTestWormHole >> test02WhenTheWhormHoleHasNegativeBackwardsMovementThenTheCreationFails [

	self
		should: [ MoonWalk createWithPosition: 1 withBackwardsMovementOf: -2 ]
		raise: Error
		withMessageText: 'The backwards movement must be positive integer'
]

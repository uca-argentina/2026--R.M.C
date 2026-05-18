Class {
	#name : 'CellTestWhromHole',
	#superclass : 'CellTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTestWhromHole >> test01whenTheWhormHoleIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := WhromHole createWithPosition: 1.
	self assert: (aCell numberOfCell )equals: 1
]

{ #category : 'tests' }
CellTestWhromHole >> test02whenTheWhormHoleHasNegativeBackwardsMovementThenCreationFailed [

	self should: [ MoonWalk createWithPosition: 1 withBackwardsMovementOf: -2 ] 
	raise: Error 
	withMessageText: 'The backwards movement must be positive integer' .
	
]

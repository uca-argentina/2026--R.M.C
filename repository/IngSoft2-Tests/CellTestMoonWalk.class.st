Class {
	#name : 'CellTestMoonWalk',
	#superclass : 'CellTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTestMoonWalk >> test01whenTheMoonWalkIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := MoonWalk createWithPosition: 1 withBackwardsMovementOf: 2.
	self assert: (aCell numberOfCell )equals: 1
]

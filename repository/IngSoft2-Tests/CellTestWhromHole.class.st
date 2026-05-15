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

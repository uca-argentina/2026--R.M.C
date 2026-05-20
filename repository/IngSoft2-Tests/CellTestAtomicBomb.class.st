Class {
	#name : 'CellTestAtomicBomb',
	#superclass : 'CellTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTestAtomicBomb >> test01WhenTheAtomicBombIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := AtomicBomb createWithPosition: 1.
	self assert: (aCell numberOfCell) equals: 1
]

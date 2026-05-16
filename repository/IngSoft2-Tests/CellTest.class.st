Class {
	#name : 'CellTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTest >> test01whenTheCellIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := Cell createWithPosition: 1.
	self assert: (aCell numberOfCell )equals: 1
]

{ #category : 'tests' }
CellTest >> test02whenTheCellIsCreatedAtAnExactPositionThenItCannotBeInAnotherPosition [

	| aCell |
	aCell := Cell createWithPosition: 1.
	self deny: (aCell numberOfCell )equals: 2
]

{ #category : 'tests' }
CellTest >> test03whenACellHasNonValidPositionThenItCannotBeCreated [

	self
		should: [ Cell createWithPosition: 'A' ]
		raise: Error
		withMessageText: 'Position cannot be negative (must be integer)'
]

{ #category : 'tests' }
CellTest >> test04whenACellHasNegativePositionThenItCannotBeCreated [

	self
		should: [ Cell createWithPosition: -5 ]
		raise: Error
		withMessageText: 'Position cannot be negative (must be integer)'
]

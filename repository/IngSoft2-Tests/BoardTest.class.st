Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test01WhenABoardIsCreatedThenItHasAPositiveNumberOfCells [
	| aBoard |
	aBoard := Board new.
	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02WhenABoardIsCreatedWithTenCellsThenItHasTenCells [

	| aBoard |
	aBoard := Board createWithATotalNumberOfCellsOf: 10.
	self assert: aBoard numberOfCells equals: 10.
]

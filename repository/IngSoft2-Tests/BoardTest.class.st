Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> should: argThatShuoldFailed raise: anError withMessageText: errorMesagge [

	self
		should: argThatShuoldFailed
		raise: anError
		withExceptionDo: [ :aPosibleError |
			self assert: aPosibleError messageText equals: errorMesagge ]
]

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
	
	self assert: aBoard numberOfCells equals: 10
]

{ #category : 'tests' }
BoardTest >> test03WhenABoardHasLessThanTwoCellsThenTheBoardCantBeCreated [

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04WhenABoardHasAnInvalidNumberOfCellsThenTheBoardCantBeCreated [

	self
		should: [ Board createWithATotalNumberOfCellsOf: 'a' ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

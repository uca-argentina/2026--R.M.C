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
BoardTest >> test01whenABoardIsCreatedThenItHasAPositiveNumberOfCells [

	| aBoard |
	aBoard := Board new.
	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02whenABoardIsCreatedThenItsHasAState [

	| aBoard |
	aBoard := Board new.
	self assert: aBoard actualState = 'not finish'
]

{ #category : 'tests' }
BoardTest >> test03whenABoardIsCreatedWithTenCellsThenItHasTenCells [

	| aBoard |
	aBoard := Board createWithATotalNumberOfCellsOf: 10.
	self assert: aBoard numberOfCells equals: 10
]

{ #category : 'tests' }
BoardTest >> test04whenABoardHasLessThanTwoCellsThenTheBoardCantBeCreated [

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05whenABoardHasAnInvalidNumberOfCellsThenTheBoardCantBeCreated [

	self
		should: [ Board createWithATotalNumberOfCellsOf: 'a' ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test06whenAShipReachesTheLastCellThenTheBoardSaysTheGameIsOver [

	| aBoard aShip |
	aBoard := Board createWithATotalNumberOfCellsOf: 8.
	aShip := Ship creatWith: 0.
	aBoard move: aShip by: 8.
	self assert: aBoard actualState = 'finish'
]

{ #category : 'tests' }
BoardTest >> test07whenAShipIsCreatedThenTheBoardKnowsItsWhereabout [

	| aBoard aShip |
	aShip := Ship creatWith: 0.
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aShip.
	self assert: (aBoard hasTheShip: aShip)
]

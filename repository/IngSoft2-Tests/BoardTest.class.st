Class {
	#name : 'BoardTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test01whenABoardIsCreatedThenItHasAPositiveNumberOfCells [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8.

	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02whenABoardIsCreatedWithTenCellsThenItHasTenCells [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.

	self assert: aBoard numberOfCells equals: 10
]

{ #category : 'tests' }
BoardTest >> test03whenABoardHasLessThanTwoCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04whenABoardHasAnInvalidNumberOfCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [
		Board createWithATotalNumberOfCellsOf: 'a']
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

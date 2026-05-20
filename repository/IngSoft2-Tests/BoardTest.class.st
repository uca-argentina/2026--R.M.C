Class {
	#name : 'BoardTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test01WhenABoardIsCreatedThenItHasAPositiveNumberOfCells [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board createWithATotalNumberOfCellsOf: 8
						 andAnAmountOfParcecsOf: 50.

	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02WhenABoardIsCreatedWithTenCellsThenItHasTenCells [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board createWithATotalNumberOfCellsOf: 8
						 andAnAmountOfParcecsOf: 50.

	self assert: aBoard numberOfCells equals: 8
]

{ #category : 'tests' }
BoardTest >> test03WhenABoardHasLessThanTwoCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0
						 andAnAmountOfParcecsOf: 50. ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04WhenABoardHasAnInvalidNumberOfCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [
		Board createWithATotalNumberOfCellsOf: '8'
						 andAnAmountOfParcecsOf: 50.]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05WhenABoardIsCreatedThenItHaveANumberOfParsecs [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board createWithATotalNumberOfCellsOf: 8
						 andAnAmountOfParcecsOf: 50.

	self assert: aBoard parcecs equals: 50.
]

{ #category : 'tests' }
BoardTest >> test06WhenABoardHasNegativeAmountOfParcecsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 8
						 andAnAmountOfParcecsOf: -50. ]
		raise: Error
		withMessageText: 'The board must have an positive integer number of parcecs'
]

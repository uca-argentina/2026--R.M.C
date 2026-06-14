Class {
	#name : 'BoardTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'aCollectionOfShips',
		'aBoard',
		'aCollectionOfCards',
		'anOverload'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
BoardTest >> arrangeBoardTestWithOneCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection with: anOverload.
]

{ #category : 'tests - initial state' }
BoardTest >> arrangeBoardTestWithOneShip [

	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection with: aShip.
]

{ #category : 'tests - initial state' }
BoardTest >> arrangeBoardTestWithOneShipAndOneBoardWithEightCells [

	self arrangeBoardTestWithOneCard.
	self arrangeBoardTestWithOneShip.
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50
]

{ #category : 'tests' }
BoardTest >> test01WhenABoardIsCreatedThenItHasAPositiveNumberOfCells [

	self arrangeBoardTestWithOneShipAndOneBoardWithEightCells.

	self assert: (aBoard numberOfCells) positive
]

{ #category : 'tests' }
BoardTest >> test02WhenABoardIsCreatedWithTenCellsThenItHasTenCells [

	self arrangeBoardTestWithOneShipAndOneBoardWithEightCells.

	self assert: (aBoard numberOfCells) equals: 8
]

{ #category : 'tests' }
BoardTest >> test03WhenABoardHasLessThanTwoCellsThenTheBoardCannotBeCreated [

	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 andAnAmountOfParcecsOf: 50 ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04WhenABoardHasAnInvalidNumberOfCellsThenTheBoardCannotBeCreated [

	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: '8' 	andAnAmountOfParcecsOf: 50 ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05WhenABoardIsCreatedThenItHaveANumberOfParsecs [

	self arrangeBoardTestWithOneShipAndOneBoardWithEightCells.

	self assert: (aBoard parcecs) equals: 50
]

{ #category : 'tests' }
BoardTest >> test06WhenABoardHasNegativeAmountOfParcecsThenTheBoardCannotBeCreated [

	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: -50 ]
		raise: Error
		withMessageText: 'The board must have an positive integer number of parcecs'
]

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

{ #category : 'tests' }
BoardTest >> test01WhenABoardIsCreatedThenItHasAPositiveNumberOfCells [

	self arrangeBoardTestWithOneCard.
	self arrangeBoardTestWithOneShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50
		          using: (ChargedCellGenerator forBoardOfSize: 8).

	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02WhenABoardIsCreatedWithEightCellsThenItHasEightCells [

	self arrangeBoardTestWithOneCard.
	self arrangeBoardTestWithOneShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50
		          using: (ChargedCellGenerator forBoardOfSize: 8).

	self assert: (aBoard numberOfCells) equals: 8
]

{ #category : 'tests' }
BoardTest >> test03WhenABoardHasLessThanTwoCellsThenTheBoardCannotBeCreated [

	self arrangeBoardTestWithOneCard.
	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.

	self
		should: [ 	aBoard := Board
		          createWithATotalNumberOfCellsOf: 0
		          andAnAmountOfParcecsOf: 50
		          using: (ChargedCellGenerator forBoardOfSize: 0). ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04WhenABoardHasAnInvalidNumberOfCellsThenTheBoardCannotBeCreated [

	self arrangeBoardTestWithOneCard.
	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.

	self
		should: [ 	aBoard := Board
		          createWithATotalNumberOfCellsOf: '8'
		          andAnAmountOfParcecsOf: 50
		          using: (ChargedCellGenerator forBoardOfSize: 8). ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05WhenABoardIsCreatedThenItHaveANumberOfParsecs [

	self arrangeBoardTestWithOneCard.
	self arrangeBoardTestWithOneShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50
		          using: (ChargedCellGenerator forBoardOfSize: 8)..

	self assert: (aBoard parcecs) equals: 50
]

{ #category : 'tests' }
BoardTest >> test06WhenABoardHasNegativeAmountOfParcecsThenTheBoardCannotBeCreated [

	self arrangeBoardTestWithOneCard.
	self arrangeBoardTestWithOneShip.

	self
		should: [	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: -50
		          using: (ChargedCellGenerator forBoardOfSize: 8).]
		raise: Error
		withMessageText: 'The board must have an positive integer number of parcecs'
]

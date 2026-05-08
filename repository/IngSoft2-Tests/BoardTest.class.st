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

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test02whenABoardIsCreatedWithTenCellsThenItHasTenCells [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andShips: aCollectionOfShips.

	self assert: aBoard numberOfCells equals: 10
]

{ #category : 'tests' }
BoardTest >> test03whenABoardHasLessThanTwoCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 andShips: aShip ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test04whenABoardHasAnInvalidNumberOfCellsThenTheBoardCannotBeCreated [

	| aShip |
	aShip := Ship createWithName: 'juan'.

	self
		should: [
		Board createWithATotalNumberOfCellsOf: 'a' andShips: aShip ]
		raise: Error
		withMessageText: 'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05whenAShipsIsCreatedInTheGameThenTheirWhereaboutAtTheBoardIsZero [

	| aBoard aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.
	self assert: (aBoard hasTheShip: aShip atThePosition: 0)
]

{ #category : 'tests' }
BoardTest >> test06whenMultipleShipsAreCreatedThenTheirWhereaboutAtTheBoardIsZero [

	| aBoard aShip aCollectionOfShips aSecondShip |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.
	self assert: (aBoard hasTheShip: aShip atThePosition: 0).
	self assert: (aBoard hasTheShip: aSecondShip atThePosition: 0)
]

{ #category : 'tests' }
BoardTest >> test07whenAnEmptyCollectionOfShipsIsCreatedThenTheBoardCreationFails [

	| aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.

	self
		should: [
			Board
				createWithATotalNumberOfCellsOf: 8
				andShips: aCollectionOfShips ]
		raise: Error
		withMessageText: 'There must be at least one ship in the board'
]

{ #category : 'tests' }
BoardTest >> test08whenABoardIsCreatedWithDuplicatedShipsThenTheBoardCreationFails [

	| aShip aCollectionOfShips |
	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aShip.

	self
		should: [
			Board
				createWithATotalNumberOfCellsOf: 8
				andShips: aCollectionOfShips ]
		raise: Error
		withMessageText: 'There cant be two equals ships in the board'
]

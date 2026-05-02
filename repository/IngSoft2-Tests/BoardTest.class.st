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
	"| aBoard |
	aBoard := Board new."

	| aBoard aShip aCollectionOfShips |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aCollectionOfShips.
	
	self assert: aBoard numberOfCells positive
]

{ #category : 'tests' }
BoardTest >> test03whenABoardIsCreatedWithTenCellsThenItHasTenCells [
	"| aBoard |
	aBoard := Board createWithATotalNumberOfCellsOf: 10."

	| aBoard aShip aCollectionOfShips |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aBoard := Board createWithATotalNumberOfCellsOf: 10 andShips: aCollectionOfShips.

	self assert: aBoard numberOfCells equals: 10
]

{ #category : 'tests' }
BoardTest >> test04whenABoardHasLessThanTwoCellsThenTheBoardCantBeCreated [

	| aShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	self
		should: [ Board createWithATotalNumberOfCellsOf: 0 andShips: aShip ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test05whenABoardHasAnInvalidNumberOfCellsThenTheBoardCantBeCreated [

	| aShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.

	self
		should: [ Board createWithATotalNumberOfCellsOf: 'a' andShips: aShip ]
		raise: Error
		withMessageText:
		'The board must have an integer number of cells greater than two'
]

{ #category : 'tests' }
BoardTest >> test08whenAShipsIsInGameThenTheirWhereaboutAtTheBoardIsZero [

	| aBoard aShip aCollectionOfShips |
	
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aCollectionOfShips.
	self assert: (aBoard hasTheShip: aShip atThePosition: 0)
]

{ #category : 'tests' }
BoardTest >> test08whenMultipleShipsAreCreatedThenTheirWhereaboutAtTheBoardIsZero [

	| aBoard aShip aCollectionOfShips aSecondShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aSecondShip := Ship creatWithposition: 0 name: 'juani'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aCollectionOfShips .
	self assert: (aBoard hasTheShip: aShip atThePosition: 0).
	self assert: (aBoard hasTheShip: aSecondShip atThePosition: 0).
]

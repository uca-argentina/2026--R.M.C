Class {
	#name : 'ShipTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01whenAShipIsAtZeroStartingPosition [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	self assert: (aShip isAt: 0 in: aBoard)
]

{ #category : 'tests' }
ShipTests >> test02whenAShipAdvancesFiveStepsThenThePositionIsFive [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	aShip advancesTo: 5 in: aBoard.
	self assert: (aShip isAt: 5 in: aBoard)
]

{ #category : 'tests' }
ShipTests >> test03whenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test04whenAShipAdvancesThenTheBoardChangesTheShipsPositionAsWell [

	| aShip aBoard aCollectionOfShips |
	aShip := Ship creatWithposition: 0 name: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	aShip advancesTo: 5 in: aBoard.
	self assert: (aShip isAt: 5 in: aBoard)
]

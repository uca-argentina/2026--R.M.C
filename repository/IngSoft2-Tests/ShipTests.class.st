Class {
	#name : 'ShipTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01whenAShipIsAtZeroStartingPosition [

	| aShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	self assert: (aShip isAt: 0)
]

{ #category : 'tests' }
ShipTests >> test02whenAShipAdvancesFiveStepsThenThePositionIsFive [

	| aShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aShip advancesTo: 5.
	self assert: (aShip isAt: 5)
]

{ #category : 'tests' }
ShipTests >> test03whenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	| aShip |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aShip advancesTo: 5.
	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test04whenAShipAdvancesThenTheBoardChangesTheShipsPositionAsWell [

	| aShip aBoard aCollectionOfShips |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aCollectionOfShips.

	aShip advancesTo: 5 in: aBoard.
	self assert: (aShip isAt: 5 in: aBoard)
]

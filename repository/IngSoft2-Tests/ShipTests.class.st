Class {
	#name : 'ShipTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01whenAShipIsAtZeroStartingPosition [

	| aShip |
	aShip := Ship creatWith: 0.
	self assert: (aShip isAt: 0)
]

{ #category : 'tests' }
ShipTests >> test02whenAShipAdvancesFiveStepsThenThePositionIsFive [

	| aShip |
	aShip := Ship creatWith: 0.
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

	| aShip aBoard |
	aShip := Ship creatWithposition: 0 name: 'juan'.
	aBoard := Board createWithATotalNumberOfCellsOf: 8 andShips: aShip.
	aShip advancesTo: 5 in: aBoard.
	self assert: (aShip isAt: 5 in: aBoard)
]

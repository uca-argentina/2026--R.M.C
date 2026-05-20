Class {
	#name : 'ShipTests',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01WhenAShipIsAtZeroStartingPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aBoard aChargedDice aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
ShipTests >> test02WhenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	| aShip  |
	aShip := Ship createWithName: 'juan'.
	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test03WhenAShipInANegativePositionTryToBeCreatedThenTheCreationFailes [

	self
		should: [ Ship createWithName: 5 ]
		raise: Error
		withMessageText: 'The name must be a string'
]

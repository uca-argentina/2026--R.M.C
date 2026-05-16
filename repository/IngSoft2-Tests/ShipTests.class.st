Class {
	#name : 'ShipTests',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01whenAShipIsAtZeroStartingPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aBoard aChargedDice |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 5.

	self assert: (aGame theShip: aShip isAt: 0).
]

{ #category : 'tests' }
ShipTests >> test02whenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	| aShip  |
	aShip := Ship createWithName: 'juan'.
	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test03whenAShipInANegativePositionTryToBeCreatedThenTheCreationFailes [

	self
		should: [ Ship createWithName: 5 ]
		raise: Error
		withMessageText: 'The name must be a string'
]

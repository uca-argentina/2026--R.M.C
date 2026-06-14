Class {
	#name : 'ShipTests',
	#superclass : 'TestsTools',
	#instVars : [
		'aGame',
		'aShip',
		'aCollectionOfShips',
		'aChargedDice',
		'aCollectionOfDice',
		'aBoard',
		'aShipPositionManager',
		'aTurnManager'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
ShipTests >> arrangeShipTestWithOneShipOneDieOfSixFacesOneBoardWithEightCellsAndFiveLaps [

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice
]

{ #category : 'tests' }
ShipTests >> test01WhenAShipIsAtZeroStartingPosition [

	self arrangeShipTestWithOneShipOneDieOfSixFacesOneBoardWithEightCellsAndFiveLaps.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
ShipTests >> test02WhenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

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

{ #category : 'tests' }
ShipTests >> test04WhenAShipHasOneCard [

	| aSobreCard |
	aSobreCard := SobreCarga new.
	aShip := Ship createWithName: 'juan' andWithCard: [ aSobreCard ].

	self assert: (aShip hasCardLeft) equals: 1
]

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
		'aTurnManager',
		'aCollectionOfCards',
		'anOverload'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
ShipTests >> arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
ShipTests >> arrangeGameTestWithOneCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
]

{ #category : 'tests - initial state' }
ShipTests >> arrangeGameTestWithOneDieOfSixFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
ShipTests >> arrangeGameTestWithOneShip [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
]

{ #category : 'tests' }
ShipTests >> test01WhenAShipIsAtZeroStartingPosition [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
ShipTests >> test02WhenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.

	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test03WhenAShipsNameIsNotAStringThenTheCreationFails [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.

	self
		should: [ Ship createWithName: 5 andWithACollectionOfCards: aCollectionOfCards ]
		raise: Error
		withMessageText: 'The name must be a string'
]

{ #category : 'tests' }
ShipTests >> test04WhenAShipIsCreatedWithOneCardThenTheShipKnowsHowManyCardsItHasLeft [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.

	self assert: (aShip hasCardsLeft) equals: 1
]

{ #category : 'tests' }
ShipTests >> test05WhenAShipsCollectionOfCardsIsEmptyThenTheCreationFails [

	aCollectionOfCards := OrderedCollection new.

	self
		should: [ Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards ]
		raise: Error
		withMessageText: 'The collection of cards cannot be empty'
]

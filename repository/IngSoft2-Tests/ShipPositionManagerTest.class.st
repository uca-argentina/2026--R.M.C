Class {
	#name : 'ShipPositionManagerTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'aSecondShip',
		'aCollectionOfShips',
		'aShipPositionManager',
		'aCollectionOfCards',
		'anOverload'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
ShipPositionManagerTest >> arrangeShipPositionManagerTestWithOneCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection with: anOverload.
]

{ #category : 'tests - initial state' }
ShipPositionManagerTest >> arrangeShipPositionManagerTestWithTwoShips [

	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection with: aShip with: aSecondShip.
]

{ #category : 'tests' }
ShipPositionManagerTest >> test01WhenAPositionManagerHaveAnEmptyShipsCollectionThenItCantBeCreated [

	self
		should: [ ShipPositionManager createWith: OrderedCollection new andNumberOfLaps: 3 ]
		raise: Error
		withMessageText: 'There must be one ship in de manager of positions'
]

{ #category : 'tests' }
ShipPositionManagerTest >> test02WhenAPositionManagerHaveAnNegativeAmountOfLapsThenItCantBeCreated [

	self arrangeShipPositionManagerTestWithOneCard.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: (Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards).

	self
		should: [ ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: -1 ]
		raise: Error
		withMessageText: 'There must be a lap in race'
]

{ #category : 'tests' }
ShipPositionManagerTest >> test03WhenAPositionManagerIsCreatedThenAllShipsStartAtPositionZero [

	self arrangeShipPositionManagerTestWithOneCard.
	self arrangeShipPositionManagerTestWithTwoShips.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.

	self assert: (aShipPositionManager is: aShip atPosition: 0).
	self assert: (aShipPositionManager is: aSecondShip atPosition: 0)
]

{ #category : 'tests' }
ShipPositionManagerTest >> test04WhenAPositionManagerIsCreatedThenAllShipsStartAtLapZero [

	self arrangeShipPositionManagerTestWithOneCard.
	self arrangeShipPositionManagerTestWithTwoShips.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.

	self assert: (aShipPositionManager is: aShip atLap: 0).
	self assert: (aShipPositionManager is: aSecondShip atLap: 0)
]

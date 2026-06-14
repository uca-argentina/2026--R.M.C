Class {
	#name : 'ShipPositionManagerTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'anotherShip',
		'aCollectionOfShips',
		'aShipPositionManager'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
ShipPositionManagerTest >> arrangeShipPositionManagerTestWithTwoShipsAndFiveLaps [

	aShip := Ship createWithName: 'juan'.
	anotherShip := Ship createWithName: 'fran'.
	aCollectionOfShips := OrderedCollection with: aShip with: anotherShip.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.
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

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: (Ship createWithName: 'uno').

	self
		should: [ ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: -1 ]
		raise: Error
		withMessageText: 'There must be a lap in race'
]

{ #category : 'tests' }
ShipPositionManagerTest >> test03WhenCreatedThenAllShipsStartAtPositionZero [

	self arrangeShipPositionManagerTestWithTwoShipsAndFiveLaps.

	self assert: (aShipPositionManager is: aShip atPosition: 0).
	self assert: (aShipPositionManager is: anotherShip atPosition: 0)
]

{ #category : 'tests' }
ShipPositionManagerTest >> test04WhenCreatedThenAllShipsStartAtLapZero [

	self arrangeShipPositionManagerTestWithTwoShipsAndFiveLaps.

	self assert: (aShipPositionManager is: aShip atLap: 0).
	self assert: (aShipPositionManager is: anotherShip atLap: 0)
]

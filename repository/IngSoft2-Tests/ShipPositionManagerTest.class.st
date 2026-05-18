Class {
	#name : 'ShipPositionManagerTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipPositionManagerTest >> test01WhenAPositionManagerHaveAnEmptyShipsCollectionThenItCantBeCreated [

	self
		should: [
				PositionShipManager
					createWith: OrderedCollection new
					andNumberOfLaps: 3 ]
		raise: Error
		withMessageText: 'There must be one ship in de manager of positions'
]

{ #category : 'tests' }
ShipPositionManagerTest >> test02WhenAPositionManagerHaveAnNegativeAmountOfLapsThenItCantBeCreated [

 	| aCollectionOfShips |
	aCollectionOfShips:= OrderedCollection new.
	aCollectionOfShips add: ( Ship createWithName: 'uno').
	

	self
		should: [
				PositionShipManager
					createWith: aCollectionOfShips
					andNumberOfLaps: -1 ]
		raise: Error
		withMessageText: 'There must be a lap in race'
]

{ #category : 'tests' }
ShipPositionManagerTest >> test03WhenCreatedThenAllShipsStartAtPositionZero [

	| aShip anotherShip ships manager |

	aShip := Ship createWithName: 'juan'.
	anotherShip := Ship createWithName: 'fran'.
	ships := OrderedCollection with: aShip with: anotherShip.

	manager := PositionShipManager
					createWith: ships
					andNumberOfLaps: 5 .

	self assert: (manager is: aShip atPosition: 0).
	self assert: (manager is: anotherShip atPosition: 0).
]

{ #category : 'tests' }
ShipPositionManagerTest >> test04WhenCreatedThenAllShipsStartAtLapZero [

	| aShip anotherShip ships manager |

	aShip := Ship createWithName: 'juan'.
	anotherShip := Ship createWithName: 'fran'.
	ships := OrderedCollection with: aShip with: anotherShip.

	manager := PositionShipManager
					createWith: ships
					andNumberOfLaps: 5 .
					
	self assert: (manager is: aShip atLap: 0).
	self assert: (manager is: anotherShip atLap: 0).
]

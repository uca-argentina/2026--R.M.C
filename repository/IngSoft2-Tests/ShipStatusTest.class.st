Class {
	#name : 'ShipStatusTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipStatusTest >> test01WhenShipRaceStatusIsCreatedThenItKnowsItsInitialState [

	| aShip status |

	aShip := Ship createWithName: 'juan'.
	status := ShipRaceStatus for: aShip.

	self assert: status ship equals: aShip.
	self assert: status boardPosition equals: 0.
	self assert: status lap equals: 0.
]

{ #category : 'tests' }
ShipStatusTest >> test02WhenAShipRaceStatusMovesForwardThenItUpdatesPositionAndLap [

	| aShip aShipRaceStatus |

	aShip := Ship createWithName: 'juan'.

	aShipRaceStatus := ShipRaceStatus for: aShip.

	aShipRaceStatus
		advanceBy: 13
		inBoardOfSize: 10.

	self assert: (aShipRaceStatus isAtPosition: 3).
	self assert: (aShipRaceStatus isAtLap: 1).
]

{ #category : 'tests' }
ShipStatusTest >> test03WhenAShipRaceStatusMovesBackMoreThanItsCurrentPositionThenItStopsAtZero [

	| aShip aShipRaceStatus |

	aShip := Ship createWithName: 'juan'.

	aShipRaceStatus := ShipRaceStatus for: aShip.

	aShipRaceStatus
		advanceBy: -5
		inBoardOfSize: 10.

	self assert: (aShipRaceStatus isAtPosition: 0).
	self assert: (aShipRaceStatus isAtLap: 0).
]

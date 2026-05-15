Class {
	#name : 'ShipTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ShipTests >> should: argThatShuoldFailed raise: anError withMessageText: errorMesagge [

	self
		should: argThatShuoldFailed
		raise: anError
		withExceptionDo: [ :aPosibleError |
			self assert: aPosibleError messageText equals: errorMesagge ]
]

{ #category : 'tests' }
ShipTests >> test01whenAShipIsAtZeroStartingPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aBoard aChargedDice |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8.

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

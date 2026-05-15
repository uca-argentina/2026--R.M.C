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

	| aShip aCollectionOfShips aBoard |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	self assert: (aShip isAt: 0 in: aBoard)
]

{ #category : 'tests' }
ShipTests >> test02whenAShipIsCreatedWhitANameThenTheShipKnowsItsName [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andShips: aCollectionOfShips.

	self assert: (aShip nameIs: 'juan')
]

{ #category : 'tests' }
ShipTests >> test03whenAShipInANegativePositionTryToBeCreatedThenTheCreationFailes [

	self
		should: [ Ship createWithName: 5 ]
		raise: Error
		withMessageText: 'The name must be a string'
]

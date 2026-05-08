Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
CellTest >> should: argThatShuoldFailed raise: anError withMessageText: errorMesagge [

	self
		should: argThatShuoldFailed
		raise: anError
		withExceptionDo: [ :aPosibleError |
			self assert: aPosibleError messageText equals: errorMesagge ]
]

{ #category : 'tests' }
CellTest >> test01whenTheCellIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := Cell createWithPosition: 1.
	self assert: (aCell numberOfCell )equals: 1
]

{ #category : 'tests' }
CellTest >> test02whenTheCellIsCreatedAtAnExactPositionThenItCannotBeInAnotherPosition [

	| aCell |
	aCell := Cell createWithPosition: 1.
	self deny: (aCell numberOfCell )equals: 2
]

{ #category : 'tests' }
CellTest >> test03whenTheCellReceivesAShipThenTheCellKnowsItsTotalAmountOfShips [

	| aCell aShip |
	aCell := Cell createWithPosition: 1.
	aShip := Ship createWithName: 'juan'.
	aCell received: aShip.
	self assert: (aCell hasAmountOfShips: 1)
]

{ #category : 'tests' }
CellTest >> test04whenTheCellLosesAShipThenTheTotalAmountOfShipsIsReducedByOne [

	| aCell aShip |
	aCell := Cell createWithPosition: 1.
	aShip := Ship createWithName: 'juan'.
	aCell received: aShip.
	aCell lose: aShip.
	self assert: (aCell hasAmountOfShips: 0)
]

{ #category : 'tests' }
CellTest >> test05whenACellHasNonValidPositionThenItCannotBeCreated [

	self
		should: [ Cell createWithPosition: 'A' ]
		raise: Error
		withMessageText: 'Position cannot be negative (must be integer)'
]

{ #category : 'tests' }
CellTest >> test06whenACellHasNegativePositionThenItCannotBeCreated [

	self
		should: [ Cell createWithPosition: -5 ]
		raise: Error
		withMessageText: 'Position cannot be negative (must be integer)'
]

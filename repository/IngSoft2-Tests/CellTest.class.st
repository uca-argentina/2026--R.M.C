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
	self assert: (aCell isAt: 1)
]

{ #category : 'tests' }
CellTest >> test02whenTheCellIsCreatedAtAnExactPositionThenItCannotBeInAnotherPosition [

	| aCell |
	aCell := Cell createWithPosition: 1.
	self deny: (aCell isAt: 2)
]

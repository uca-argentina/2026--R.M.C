Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test01whenAGameStartsThenItReturnsItsName [

	| aGame |
	aGame := Game createWithName: 'Ludo'.
	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02whenAGameStartsWithASpecificNameThenItKnowsItsName [

	| aGame |
	aGame := Game createWithName: 'Generala'.
	self assert: aGame start equals: 'Generala'
]

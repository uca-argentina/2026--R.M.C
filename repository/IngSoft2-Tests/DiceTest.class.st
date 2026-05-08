Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DiceTest >> should: argThatShuoldFailed raise: anError withMessageText: errorMesagge [

	self
		should: argThatShuoldFailed
		raise: anError
		withExceptionDo: [ :aPosibleError |
			self assert: aPosibleError messageText equals: errorMesagge ]
]

{ #category : 'tests' }
DiceTest >> test01whenADiceIsThrownThenTheResultMustBePositive [

	| aDice |
	aDice := Dice default.
	self assert: aDice throw positive
]

{ #category : 'tests' }
DiceTest >> test02whenADiceIsCreatedWithAnSpecificAmountOfFacesThenTheResultMustBeLowerThanTheMaximumSize [

	| aDice |
	aDice := Dice withTotalNumberFaces: 10.
	self assert: (aDice throw between: 1 and: 10)
]

{ #category : 'tests' }
DiceTest >> test03whenADiceHasANumberOfFacesLowerThanTwoThenItCannotBeCreated [

	self
		should: [ Dice withTotalNumberFaces: 2 ]
		raise: Error
		withMessageText: 'Number of faces cannot be lower that two (must be integer)'
]

{ #category : 'tests' }
DiceTest >> test04whenADiceHasNonValidNumberOfFacesThenItCannotBeCreated [

	self
		should: [ Dice withTotalNumberFaces: 'A' ]
		raise: Error
		withMessageText: 'Number of faces cannot be lower that two (must be integer)'
]

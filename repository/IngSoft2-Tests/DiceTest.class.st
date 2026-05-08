Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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

Class {
	#name : 'CellTestSpeedUp',
	#superclass : 'CellTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTestSpeedUp >> test01whenTheSpeedUpIsCreatedThenItKnowsItsPosition [

	| aCell |
	aCell := SpeedUp createWithPosition: 1.
	self assert: (aCell numberOfCell) equals: 1
]

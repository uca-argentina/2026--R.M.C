Class {
	#name : 'TurnManagerTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
TurnManagerTest >> test01whenATurnManagerIsCreated [

| aShip aTurnManager |
aShip := Ship createWithName: 'santi'.
aTurnManager := TurnManager creatWith: #(aShip).
]

{ #category : 'tests' }
TurnManagerTest >> test02whenATurnManagerHasAnEmptyCollectionThenItsFailed [

	self
		should: [ TurnManager creatWith: #(  ) ]
		raise: Error
		withMessageText: 'The list of ships cannot be empty'
]

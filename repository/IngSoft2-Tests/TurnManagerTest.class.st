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

	aTurnManager := TurnManager
		creatWith: (Array with: aShip).

	self assert:
		(aTurnManager nextShipToPlayInGame) equals: aShip.
		

]

{ #category : 'tests' }
TurnManagerTest >> test02whenATurnManagerHasAnEmptyCollectionThenItsFailed [

	self
		should: [ TurnManager creatWith: #(  ) ]
		raise: Error
		withMessageText: 'The list of ships cannot be empty'
]

{ #category : 'tests' }
TurnManagerTest >> test03whenATurnManagerManageThePlayersThenTheyPlayInSecuence [

	| aShip aTurnManager aSecondShip |

	aShip := Ship createWithName: 'santi'.
	aSecondShip := Ship createWithName: 'juani'.

	aTurnManager := TurnManager
		creatWith: (Array with: aShip with: aSecondShip).

	self assert:
		(aTurnManager nextShipToPlayInGame) equals: aShip.

	self assert:
		(aTurnManager nextShipToPlayInGame) equals: aSecondShip.
]

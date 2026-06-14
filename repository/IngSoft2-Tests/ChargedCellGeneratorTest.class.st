Class {
	#name : 'ChargedCellGeneratorTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'aCollectionOfShips',
		'aBoard'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ChargedCellGeneratorTest >> test01WhenChargedCellGeneratorCreatesCommonCellWhenNoCellWasChargedThenCelAreCell [
	| generator cell |

	generator := ChargedCellGenerator forBoardOfSize: 10.

	cell := generator cellForPosition: 4.

	self assert: cell class equals: Cell.
	self assert: cell numberOfCell equals: 4
]

{ #category : 'tests' }
ChargedCellGeneratorTest >> test02WhenChargedCellGeneratorChargedCellAtSelectedPositionThenItsTheEspecificCEll [

	| generator chargedCell generatedCell |

	generator := ChargedCellGenerator forBoardOfSize: 10.
	chargedCell := WormHole createWithPosition: 6.

	generator put: chargedCell at: 6.

	generatedCell := generator cellForPosition: 6.

	self assert: generatedCell equals: chargedCell
]

{ #category : 'tests' }
ChargedCellGeneratorTest >> test03ChargedCellGeneratorCreatesCommonCellInOtherPositions [

	| generator chargedCell generatedCell |

	generator := ChargedCellGenerator forBoardOfSize: 10.
	chargedCell := WormHole createWithPosition: 6.

	generator put: chargedCell at: 6.

	generatedCell := generator cellForPosition: 3.

	self assert: generatedCell class equals: Cell.
	self assert: generatedCell numberOfCell equals: 3
]

{ #category : 'tests' }
ChargedCellGeneratorTest >> test04ChargedCellGeneratorRaisesErrorWhenPuttingCellInNegativePosition [

	| generator |

	generator := ChargedCellGenerator forBoardOfSize: 10.

	self
		should: [
			generator
				put: (WormHole createWithPosition: -1)
				at: -1 ]
		raise: Error
		withMessageText: 'Invalid cell position'
]

{ #category : 'tests' }
ChargedCellGeneratorTest >> test05ChargedCellGeneratorRaisesErrorWhenPuttingCellOutOfBoard [

	| generator |

	generator := ChargedCellGenerator forBoardOfSize: 10.

	self
		should: [
			generator
				put: (WormHole createWithPosition: 11)
				at: 11 ]
		raise: Error
		withMessageText: 'Invalid cell position'
]

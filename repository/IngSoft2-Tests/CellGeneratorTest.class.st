Class {
	#name : 'CellGeneratorTest',
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
CellGeneratorTest >> test01WhenRandomCellGeneratorGetsNumberInFirstRangeThenCreatesCommonCell [

	| distribution generator cell random |

	random := Random seed: 1.

	distribution := CellProbabilityDistribution withRules: {
		1.00 -> [ :position | Cell createWithPosition: position ] }.

	generator := RandomCellGenerator
		using: distribution
		andRandom: random.

	cell := generator cellForPosition: 4.

	self assert: cell class equals: Cell.
	self assert: cell numberOfCell equals: 4
]

{ #category : 'tests' }
CellGeneratorTest >> test02WhenRandomCellGeneratorUsesControlledDistributionThenCreatesExpectedCell [

	| distribution generator cell random |

	random := Random seed: 1.

	distribution := CellProbabilityDistribution withRules: {
		0.00 -> [ :position | Cell createWithPosition: position ].
		1.00 -> [ :position | WormHole createWithPosition: position ] }.

	generator := RandomCellGenerator
		using: distribution
		andRandom: random.

	cell := generator cellForPosition: 6.

	self assert: cell class equals: WormHole.
	self assert: cell numberOfCell equals: 6
]

{ #category : 'tests' }
CellGeneratorTest >> test03WhenRandomCellGeneratorUsesDefaultDistributionThenItCreatesACell [

	| distribution generator cell random |

	random := Random seed: 1.

	distribution := CellProbabilityDistribution defaultFor: random.

	generator := RandomCellGenerator
		using: distribution
		andRandom: random.

	cell := generator cellForPosition: 5.

	self assert: (cell isKindOf: Cell).
	self assert: cell numberOfCell equals: 5
]

{ #category : 'tests' }
CellGeneratorTest >> test04WhenDefaultDistributionGetsNumberInCardDealerRangeThenCreatesCardDealerCell [

	| distribution cell random |

	random := Random seed: 1.

	distribution := CellProbabilityDistribution defaultFor: random.

	cell := distribution cellFor: 0.95 atPosition: 7.

	self assert: cell class equals: CardDealerCell.
	self assert: cell numberOfCell equals: 7
]

{ #category : 'tests' }
CellGeneratorTest >> test05WhenDefaultDistributionGetsNumberInCommonCellRangeThenCreatesCommonCell [

	| distribution cell random |

	random := Random seed: 1.

	distribution := CellProbabilityDistribution defaultFor: random.

	cell := distribution cellFor: 0.30 atPosition: 2.

	self assert: cell class equals: Cell.
	self assert: cell numberOfCell equals: 2
]

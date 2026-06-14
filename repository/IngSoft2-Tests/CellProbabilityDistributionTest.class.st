Class {
	#name : 'CellProbabilityDistributionTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aShip',
		'aCollectionOfShips',
		'aBoard'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
CellProbabilityDistributionTest >> distributionForTesting [

	^ CellProbabilityDistribution withRules: {
		  0.40 -> [ :position | Cell createWithPosition: position ].
		  0.60 -> [ :position | WormHole createWithPosition: position ].
		  0.80 -> [ :position | SpeedUp createWithPosition: position ].
		  0.90 -> [ :position | MoonWalk createWithPosition: position withBackwardsMovementOf: 2 ].
		  0.98 -> [ :position | HyperJump createWithPosition: position andParsecs: #(10 5 2) ].
		  1.00 -> [ :position | AtomicBomb createWithPosition: position ]
	  }
]

{ #category : 'as yet unclassified' }
CellProbabilityDistributionTest >> test01CellProbabilityDistributionCreatesCommonCell [

	| distribution cell |
	distribution := self distributionForTesting.
	cell := distribution cellFor: 0.35 atPosition: 4.

	self assert: cell class equals: Cell.
	self assert: cell numberOfCell equals: 4
]

{ #category : 'as yet unclassified' }
CellProbabilityDistributionTest >> test02CellProbabilityDistributionCreatesWormHole [

	| distribution cell |
	distribution := self distributionForTesting.
	cell := distribution cellFor: 0.55 atPosition: 4.

	self assert: cell class equals: WormHole.
	self assert: cell numberOfCell equals: 4
]

{ #category : 'as yet unclassified' }
CellProbabilityDistributionTest >> test03CellProbabilityDistributionIncludesUpperLimitInCurrentRange [

	| distribution cell |
	distribution := self distributionForTesting.
	cell := distribution cellFor: 0.40 atPosition: 4.

	self assert: cell class equals: Cell
]

Class {
	#name : 'CellProbabilityDistribution',
	#superclass : 'Object',
	#instVars : [
		'rules'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CellProbabilityDistribution class >> defaultFor: aRandom [

	^ self withRules: {
		  0.40 -> [ :position |
			  Cell createWithPosition: position ].

		  0.60 -> [ :position |
			  WormHole createWithPosition: position ].

		  0.80 -> [ :position |
			  SpeedUp createWithPosition: position ].

		  0.90 -> [ :position |
			  MoonWalk
				  createWithPosition: position
				  withBackwardsMovementOf: (aRandom nextInteger: 5) ].

		  0.98 -> [ :position |
			  HyperJump
				  createWithPosition: position
				  andParsecs: #(10 8 6 4) ].

		  1.00 -> [ :position |
			  AtomicBomb createWithPosition: position ]
	  }
]

{ #category : 'as yet unclassified' }
CellProbabilityDistribution class >> withRules: aCollectionOfRules [

	^ self new initializeWithRules: aCollectionOfRules
]

{ #category : 'initialization' }
CellProbabilityDistribution >> cellFor: aNumber atPosition: aPosition [

	| selectedRule |

	selectedRule := rules detect: [ :rule |
		                aNumber <= rule key ].

	^ selectedRule value value: aPosition
]

{ #category : 'initialization' }
CellProbabilityDistribution >> initializeWithRules: aCollectionOfRules [

	rules := aCollectionOfRules
]

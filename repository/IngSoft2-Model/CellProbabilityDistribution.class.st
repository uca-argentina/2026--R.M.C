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

	| cardGenerator |

	cardGenerator := Deck
		using: aRandom
		andCardClasses: { Overload . Speed. Acceleration. Cancellation. Redo. Repeat }.

	^ self withRules: {
		  0.30 -> [ :position |
			  Cell createWithPosition: position ].

		  0.50 -> [ :position |
			  WormHole createWithPosition: position ].

		  0.70 -> [ :position |
			  SpeedUp createWithPosition: position ].

		  0.80 -> [ :position |
			  MoonWalk
				  createWithPosition: position
				  withBackwardsMovementOf: (aRandom nextInteger: 5) ].

		  0.88 -> [ :position |
			  HyperJump
				  createWithPosition: position
				  andParsecs: #(10 8 6 4) ].

		  0.90 -> [ :position |
			  AtomicBomb createWithPosition: position ].

		  1.00 -> [ :position |
			  CardDealerCell
				  createWithPosition: position
				  andCardGenerator: cardGenerator ]
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

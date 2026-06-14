Class {
	#name : 'RandomCellGenerator',
	#superclass : 'CellGenerator',
	#instVars : [
		'distribution',
		'random'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
RandomCellGenerator class >> using: aDistribution andRandom: aRandom [

	^ self new initializeUsing: aDistribution andRandom: aRandom
]

{ #category : 'initialization' }
RandomCellGenerator >> cellForPosition: aPosition [

	^ distribution cellFor: random next atPosition: aPosition
]

{ #category : 'initialization' }
RandomCellGenerator >> initializeUsing: aDistribution andRandom: aRandom [

	distribution := aDistribution.
	random := aRandom
]

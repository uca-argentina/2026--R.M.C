Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> creatWith: anPosition [ 
	
	^self new initializeWith:anPosition.
]

{ #category : 'as yet unclassified' }
Ship >> advancesTo: anStep [ 
	position:= position + anStep .
]

{ #category : 'initialization' }
Ship >> initializeWith: anPosition [ 
	position :=anPosition .
]

{ #category : 'accessing' }
Ship >> isAt: anPosition [ 
	^position=anPosition.
]

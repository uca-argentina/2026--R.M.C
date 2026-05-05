Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> creatWith: anPosition [ 
	
	^self new initializeWith:anPosition.
]

{ #category : 'as yet unclassified' }
Ship class >> creatWithposition:anPosition name:anName [
	
	^self new initializeWith: anPosition and:anName .
]

{ #category : 'as yet unclassified' }
Ship >> advancesTo: anStep [ 
	position:= position + anStep .
]

{ #category : 'initialization' }
Ship >> initializeWith: anPosition [ 
	position :=anPosition .
]

{ #category : 'initialization' }
Ship >> initializeWith: anPosition and:anName [
	position :=anPosition .
	name:= anName.
]

{ #category : 'accessing' }
Ship >> isAt: anPosition [ 
	^position=anPosition.
]

{ #category : 'as yet unclassified' }
Ship >> nameIs: aName [
	^name == aName .
]

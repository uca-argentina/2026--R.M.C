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
Ship class >> creatWithposition:anPosition name:anName [
	
	^self new initializeWith: anPosition and:anName .
]

{ #category : 'as yet unclassified' }
Ship >> advancesTo: aPosition in: aBoard [

	aBoard move: self by: aPosition
]

{ #category : 'initialization' }
Ship >> initializeWith: anPosition and:anName [
	position :=anPosition .
	name:= anName.
]

{ #category : 'accessing' }
Ship >> isAt: aPosition in: aBoard [

	^ aBoard hasTheShip: self atThePosition: aPosition
]

{ #category : 'as yet unclassified' }
Ship >> nameIs: aName [
	^name == aName .
]

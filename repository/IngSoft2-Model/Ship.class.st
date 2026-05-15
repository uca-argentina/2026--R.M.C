Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWithName: anName [

	self validate: anName.
	^ self new initializeWith: anName
]

{ #category : 'as yet unclassified' }
Ship class >> validate: aName [

	aName isString ifFalse: [ Error signal: 'The name must be a string' ]
]

{ #category : 'as yet unclassified' }
Ship >> advancesTo: aPosition in: aBoard of: aGame [

	aBoard move: self by: aPosition in: aGame
]

{ #category : 'as yet unclassified' }
Ship >> advancesToWithoutEffect: aNumber in: aBoard [ 

	aBoard moveWithoutEffect: self by: aNumber
]

{ #category : 'initialization' }
Ship >> initializeWith: anName [

	name := anName
]

{ #category : 'accessing' }
Ship >> isAt: aPosition in: aBoard [

	^ aBoard hasTheShip: self atThePosition: aPosition
]

{ #category : 'as yet unclassified' }
Ship >> nameIs: aName [

	^ name == aName
]

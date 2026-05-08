Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cell class >> createWithPosition: aPosition [

	^ self new initializeWithPosition: aPosition
]

{ #category : 'initialization' }
Cell >> initializeWithPosition: aPosition [

	position := aPosition
]

{ #category : 'accessing' }
Cell >> isAt: anInteger [

	^ position = anInteger
]

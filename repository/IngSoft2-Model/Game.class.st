Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aName [

	^ self new initializeWith: aName
]

{ #category : 'initialization' }
Game >> initializeWith: aName [

	name := aName
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

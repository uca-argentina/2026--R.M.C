Class {
	#name : 'WhromHole',
	#superclass : 'Cell',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'api' }
WhromHole class >> number: aPosition [ 
	^ self new  initializeWithPosition: aPosition.
]

{ #category : 'as yet unclassified' }
WhromHole >> modifyMovement: anAmount [

	^ anAmount - 4
]

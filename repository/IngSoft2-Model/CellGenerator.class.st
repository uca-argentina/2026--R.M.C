Class {
	#name : 'CellGenerator',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
CellGenerator >> cellForPosition: aPosition [

	self subclassResponsibility
]

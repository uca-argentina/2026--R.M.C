Class {
	#name : 'BoardCharged',
	#superclass : 'Board',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardCharged >> replaceACellWith: aCell [ 

cells at:(aCell numberOfCell+1) put: aCell
]

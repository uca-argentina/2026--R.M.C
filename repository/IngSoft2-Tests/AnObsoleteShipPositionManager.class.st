Class {
	#name : 'AnObsoleteShipPositionManager',
	#superclass : 'Object',
	#instVars : [
		'lapsToWin',
		'shipStatuses'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AnObsoleteShipPositionManager class >> createWith: aCollectionOfShips andNumberOfLaps: aNumberOfLaps [

	self validate: aCollectionOfShips and: aNumberOfLaps .
	^ self new initializeWith: aCollectionOfShips and:aNumberOfLaps .
]

{ #category : 'as yet unclassified' }
AnObsoleteShipPositionManager class >> validate: aCollection and: aNumber [

	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one ship in de manager of positions' ].
	
	(aNumber >= 0) ifFalse: [
		Error signal: 'There must be a lap in race' ].
]

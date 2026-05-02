Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ships',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aName [

	^ self new initializeWith: aName
]

{ #category : 'as yet unclassified' }
Game class >> createWithName: aName andShips: aShip [
	| aBoard aCollectionOfShips |

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aBoard := Board createWithATotalNumberOfCellsOf: 3 andShips: aCollectionOfShips.
^	self new initializeWithName: aName andShips: aShip andBoard: aBoard
]

{ #category : 'initialization' }
Game >> initializeWith: aName [

	name := aName
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andShips: aShip andBoard: aBoard [

	name := aName.
	ships := aShip.
	board := aBoard
]

{ #category : 'as yet unclassified' }
Game >> moves: aShip [

	aShip advancesTo: 2
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

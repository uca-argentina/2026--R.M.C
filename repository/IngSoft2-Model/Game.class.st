Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ships',
		'board',
		'dice'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andShips: aCollectionOfShips andABordOf: aNumberOfCells andADice: aChargedDice [

	| aBoard |
	aBoard := Board
		          createWithATotalNumberOfCellsOf: aNumberOfCells
		          andShips: aCollectionOfShips.

	^ self new
		  initializeWithName: aBoardName
		  andShips: aCollectionOfShips
		  andBoard: aBoard
		  andADice: aChargedDice.
]

{ #category : 'as yet unclassified' }
Game >> boardSize [
	^ board  numberOfCells .
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andShips: aShip andBoard: aBoard andADice: aChargedDice [

	name := aName.
	dice := aChargedDice .
	ships := aShip.
	board := aBoard
]

{ #category : 'as yet unclassified' }
Game >> moves: aShip [

	aShip advancesTo: (dice throw) in: board.
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

{ #category : 'accessing' }
Game >> theShip: aShip isAt: aPosition [ 
	^(board hasTheShip: aShip atThePosition: aPosition).
]

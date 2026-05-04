Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ships',
		'board',
		'dice',
		'diceCollection'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWithName: aBoardName andShips: aCollectionOfShips andABordOf: aNumberOfCells andADice: aCollectionOfDice [

	| aBoard |
	aBoard := Board
		          createWithATotalNumberOfCellsOf: aNumberOfCells
		          andShips: aCollectionOfShips.

	self validateCollection: aCollectionOfDice with: aNumberOfCells.

	^ self new
		  initializeWithName: aBoardName
		  andShips: aCollectionOfShips
		  andBoard: aBoard
		  andADice: aCollectionOfDice
]

{ #category : 'as yet unclassified' }
Game class >> validateCollection: aCollection with: amountOfCells [
	| total |
	
	aCollection isEmpty ifTrue: [
		Error signal: 'There must be one dice in the game' ].
	
    total := 0.
    aCollection do: [ :aDie |
        total := total + aDie throw
    ].

	total > amountOfCells ifTrue: [
			Error signal:
				'There of the dices must be lower than the amount of cells' ]
]

{ #category : 'as yet unclassified' }
Game >> boardSize [
	^ board  numberOfCells .
]

{ #category : 'testing' }
Game >> canPlay [

	(board canPlay) ifTrue: [Error signal: 'The game has finished'].
]

{ #category : 'testing' }
Game >> hasFinishedAndWinnerIs: aShip [ 
	^ (board winerShip: aShip )
]

{ #category : 'initialization' }
Game >> initializeWithName: aName andShips: aShip andBoard: aBoard andADice: aCollectionOfDice [

	name := aName.
	diceCollection := aCollectionOfDice .
	ships := aShip.
	board := aBoard
]

{ #category : 'as yet unclassified' }
Game >> moves: aShip [
	| total |
	
	self canPlay.
	
	total := diceCollection sum: [ :aDie | aDie throw ].
	

	aShip advancesTo: total in: board
]

{ #category : 'accessing' }
Game >> start [

	^ name
]

{ #category : 'accessing' }
Game >> theShip: aShip isAt: aPosition [ 
	^(board hasTheShip: aShip atThePosition: aPosition).
]

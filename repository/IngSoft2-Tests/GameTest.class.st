Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
GameTest >> should: argThatShuoldFailed raise: anError withMessageText: errorMesagge [

	self
		should: argThatShuoldFailed
		raise: anError
		withExceptionDo: [ :aPosibleError |
			self assert: aPosibleError messageText equals: errorMesagge ]
]

{ #category : 'tests' }
GameTest >> test01whenAGameStartsThenItReturnsItsName [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 12.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .
		
	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02whenAGameStartsWithASpecificNameThenItKnowsItsName [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Generala'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .
	self assert: aGame start equals: 'Generala'
]

{ #category : 'tests' }
GameTest >> test03whenTheGameAdvanceATurnThenTheShipsPositionChanges [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice  aBoard |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
 
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.


	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .
		      

	aGame moves.
	self assert: (aGame theShip: aShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test04whenAGameCreatesAnNSizeBoardThenTheBoardInTheGameHasNCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	self assert: aGame boardSize equals: 10
]

{ #category : 'tests' }
GameTest >> test05whenAGameThrowsTheDiceToMoveAShipThenTheShipMovesToTheCell [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aLapManager aBoard |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test06whenAGameThrowsNDicesToMoveAShipThenTheShipMovesToTheSumOfTheDices [

	| aGame aShip aCollectionOfShips aChargedDice aSecondChargedDice aCollectionOfDice aLapManager aBoard |
	aShip := Ship createWithName: 'juan'.

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aSecondChargedDice.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.
	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test07whenAGameHasAnEmptyDicesCollectionThenTheCreationFails [

	| aShip aCollectionOfShips aCollectionOfDice aBoard aGame |
	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.

	self
		should: [
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 . ]
		raise: Error
		withMessageText: 'There must be one dice in the game'
]

{ #category : 'tests' }
GameTest >> test08whenTheSumOfTheDicesIsHigherThatTheAmountOfCellsThenTheCreationFails [

	| aShip aCollectionOfShips aChargedDice aSecondChargedDice aCollectionOfDice aBoard aGame |
	aShip := Ship createWithName: 'juan'.

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: 9.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aSecondChargedDice.
	aCollectionOfDice add: aChargedDice.

	self
		should: [
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 . ]
		raise: Error
		withMessageText:
		'There of the dices must be lower than the amount of cells'
]

{ #category : 'tests' }
GameTest >> test10whenAGameMovesTwoShipsTwiceThenTheShipsMovesToTheCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.

	aChargedDice := ChargedDice withTotalNumberFaces: 4.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 25.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.
	aGame moves.
	aGame moves.
	aGame moves.

	self assert: (aGame theShip: aShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test11whenAShipMovesToTheFinalCellThenTheGameIsFished [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |
	aShip := Ship createWithName: 'juan'.


	aChargedDice := ChargedDice withTotalNumberFaces: 4.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.


	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.
	aGame moves.


	self assert: (aGame hasFinishedAndWinnerIs: aShip)
]

{ #category : 'tests' }
GameTest >> test12whenAShipMovesToTheFinalCellThenTheGameIsFishedAndItCannotBeContinued [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.


	aChargedDice := ChargedDice withTotalNumberFaces: 4.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.


	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .
	aGame moves.
	aGame moves.
	aGame moves.

	self
		should: [ aGame _moves ]
		raise: Error
		withMessageText: 'The game has finished'
]

{ #category : 'tests' }
GameTest >> test13GameKnowsinwhichLapsAreWe [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip  aBoard |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:5 .

	aGame moves.
	aGame moves.
	aGame moves.
	aGame moves.
	aGame moves.

	self assert:  (aGame theShip: aShip isAtLap: 2).
	self assert:  (aGame theShip: aSecondShip isAtLap: 1).
]

{ #category : 'tests' }
GameTest >> test14WhenShipDoesNotCrossTheEndThenItStaysInSameLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |

	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8.

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 5.

	aGame moves.

	self assert: (aGame theShip: aShip isAtLap: 0).
]

{ #category : 'tests' }
GameTest >> test15WhenShipMovesExactlyBoardSizeThenItCompletesOneLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |

	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 8.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8.

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 5.

	aGame moves.

	self assert: (aGame theShip: aShip isAtLap: 1).
	self assert: (aGame theShip: aShip isAt: 0).
]

{ #category : 'tests' }
GameTest >> ztest140WhenAShipFallsInAWormHoleThenGameMovesItBackFourCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := ChargedBoard 
		          createWithATotalNumberOfCellsOf: 10
		          andShips: aCollectionOfShips.
	aChargedBoard putThe:(WhromHole number:6) at: 7. 

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame _moves.

	self assert: (aGame theShip: aShip isAt: 2).
]

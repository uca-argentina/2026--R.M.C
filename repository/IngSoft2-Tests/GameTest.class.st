Class {
	#name : 'GameTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test01whenAGameStartsThenItReturnsAName [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 25
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02whenAGameStartsWithASpecificNameThenItKnowsItsName [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Generala'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: aGame start equals: 'Generala'
]

{ #category : 'tests' }
GameTest >> test03whenTheGameAdvanceATurnThenTheShipsPositionChanges [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test04whenAGameCreatesAnNSizeBoardThenTheBoardInTheGameHasNCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: 5.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: aGame boardSize equals: 10
]

{ #category : 'tests' }
GameTest >> test05whenAGameThrowsTheDiceToMoveAShipThenTheShipMovesToTheCell [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(5).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test06whenAGameThrowsNDicesToMoveAShipThenTheShipMovesToTheSumOfTheDices [

	| aGame aShip aCollectionOfShips aChargedDice aSecondChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(5).
	aSecondChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aSecondChargedDice.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test07whenAGameHasAnEmptyDicesCollectionThenTheCreationFails [

	| aShip aCollectionOfShips aCollectionOfDice aBoard aGame aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.

	self
		should: [
				aGame := Game
					         createWithName: 'Ludo'
					         andAShipPositionManager: aPositionShipManager
					         andATurnManager: aTurnManager
					         andABord: aBoard
					         andADice: aCollectionOfDice ]
		raise: Error
		withMessageText: 'There must be one dice in the game'
]

{ #category : 'tests' }
GameTest >> test08whenAGameMovesTwoShipsTwiceThenTheShipsMovesToTheCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withValuesToThrow: #(4).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 25
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test09whenAShipMovesToTheFinalCellThenTheGameIsFinished [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(4).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.

	self assert: (aGame winnerIs: aShip)
]

{ #category : 'tests' }
GameTest >> test10whenAShipMovesToTheFinalCellThenTheGameIsFinishedAndItCannotBeContinued [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withValuesToThrow: #(4).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self
		should: [ aGame playTurn ]
		raise: Error
		withMessageText: 'The game has finished'
]

{ #category : 'tests' }
GameTest >> test11WhenInAGameWeAskWhereTheShipsAreThenTheGAmeReturnItsLaps [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (aGame theShip: aShip isAtLap: 2).
	self assert: (aGame theShip: aSecondShip isAtLap: 1)
]

{ #category : 'tests' }
GameTest >> test12WhenShipDoesNotCrossTheEndThenItStaysInSameLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.
	aGame playTurn.

	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test13WhenShipMovesExactlyBoardSizeThenItCompletesOneLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withValuesToThrow: #(8).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 50.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAtLap: 1).
	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test14WhenAShipFallsInAWormHoleThenGameMovesItBackFourCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 6).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test15WhenAShipFallsInAWormHoleInTwoThenGameMovesItBackToZero [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 3).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test16WhenAShipFallsInAWormHoleAndMovesToAnotherWormHoleThenSecondEffectIsNotApplied [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 6).
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 2).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test17WhenAShipFallsInAWormHoleAndGoesBackPastStartThenItLosesOneLap [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(13).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 3).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test18WhenAShipIsInLapOneAndFallsInAWormHoleThenItGoesBackToLapZero [
	| aGame aShip aCollectionOfShips aCollectionOfDice aFirstDice  aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aFirstDice := ChargedDice withValuesToThrow: #(10 3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 3).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.


	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test19WhenAShipFallsInMoonWalkThenItDoesNotMoveBackwards [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aFirstDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 6 withBackwardsMovementOf: 2).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test20whenAShipFallsInAMoonWalkCellTheTheEffectIsCorrectlyAplied [

	| aGame aShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard aSecondShip aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aFirstDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 6 withBackwardsMovementOf: 1).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test21WhenMoonWalkMovesAnotherShipBackwardsThenPositionDoesNotGoBelowZero [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aFirstDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test22WhenAShipFallsInMoonWalkThenOtherShipLosesOneLap [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn. "juan -> 6, vuelta 0"
	aGame playTurn. "pedro -> 6, vuelta 0"
	aGame playTurn. "juan -> 2, vuelta 1"
	aGame playTurn. "pedro -> 2, vuelta 1"
	aGame playTurn. "juan -> 8, vuelta 1, cae en MoonWalk"

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test23WhenAShipFallsInHyperJumpThenItAdvancesTheNextParsecValueConvertedToCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test24WhenTwoShipsFallInHyperJumpThenItUsesNextParsecValue [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	self assert: (aGame theShip: aShip isAt: 6).

	aGame playTurn.
	self assert: (aGame theShip: aSecondShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test25WhenHyperJumpUsesAllParsecValuesThenItStartsAgainFromTheBeginning [

	| aGame aShip aSecondShip aThirdShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.
	aThirdShip := Ship createWithName: 'maria'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfShips add: aThirdShip.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 20 10 )).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	self assert: (aGame theShip: aShip isAt: 5).

	aGame playTurn.
	self assert: (aGame theShip: aSecondShip isAt: 4).

	aGame playTurn.
	self assert: (aGame theShip: aThirdShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test26WhenHyperJumpParsecsDoNotDivideExactlyThenItRoundsDown [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(3).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 25 )).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test27WhenAShipFallsInASpeedUpThenGameMovesItForwardFourCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (SpeedUp createWithPosition: 6).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 10)
]

{ #category : 'tests' }
GameTest >> test28WhenAShipFallsInAnAtomicBombThenGameMovesItToTheFirstPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withValuesToThrow: #(6).
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 6).
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test29whenAShipMovesToTheFinalCellThenTheGameIsFinishedAndReturnRankings [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard aTurnManager aRanking aPositionShipManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withValuesToThrow: #(4).
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 8.
	aPositionShipManager := PositionShipManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	aRanking := aGame ranking.

	self assert: (aGame winnerIs: aShip).
	self assert: (aRanking positionOf: aShip) equals: 1.
	self assert: (aRanking positionOf: aSecondShip) equals: 2.
	self assert: (aRanking isLeader: aShip).
	self assert: aRanking orderedShips first equals: 'juan'.
	self assert: aRanking orderedShips last equals: 'fran'
]

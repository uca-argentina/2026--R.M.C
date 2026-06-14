Class {
	#name : 'GameTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aGame',
		'aShip',
		'aSecondShip',
		'aCollectionOfShips',
		'aChargedDice',
		'aSecondChargedDice',
		'aCollectionOfDice',
		'aBoard',
		'aChargedBoard',
		'aShipPositionManager',
		'aTurnManager'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneBoardOfTwentyFiveCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 25 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.

]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfEightFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 8.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfFiveFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfFourFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 4.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfSixFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfTenFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 10.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfThirteenFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 13.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneDieOfThreeFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithOneShip [

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithTwoDiceOfFiveFacesAndThreeFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aCollectionOfDice add: aSecondChargedDice.
]

{ #category : 'as yet unclassified' }
GameTest >> arrangeGameTestWithTwoShips [

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
]

{ #category : 'tests' }
GameTest >> test01WhenAGameStartsThenItReturnsItsName [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfFiveFaces.
	self arrangeGameTestWithOneBoardOfTwentyFiveCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02WhenAGameStartsWithASpecificNameThenItKnowsItsName [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfFiveFaces.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Generala'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: aGame start equals: 'Generala'
]

{ #category : 'tests' }
GameTest >> test03WhenAGameAdvancesATurnThenTheShipsPositionChanges [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test04WhenAGameCreatesAnNSizeBoardThenTheBoardInTheGameHasNCells [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfFiveFaces.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: (aGame boardSize) equals: 10
]

{ #category : 'tests' }
GameTest >> test05WhenAGameThrowsADieToMoveAShipThenTheShipMovesToTheCell [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfFiveFaces.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test06WhenAGameThrowsNDicesToMoveAShipThenTheShipMovesToTheSumOfTheDices [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithTwoDiceOfFiveFacesAndThreeFaces.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test07WhenAGameHasAnEmptyDieCollectionThenTheCreationFails [

	self arrangeGameTestWithOneShip.
	aCollectionOfDice := OrderedCollection new.
	self arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap.

	self
		should: [
				aGame := Game
					         createWithName: 'Ludo'
					         andAShipPositionManager: aShipPositionManager
					         andATurnManager: aTurnManager
					         andABord: aBoard
					         andADice: aCollectionOfDice ]
		raise: Error
		withMessageText: 'There must be one dice in the game'
]

{ #category : 'tests' }
GameTest >> test08WhenAGameMovesTwoShipsTwiceThenTheShipsMovesToTheCells [

	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOfFourFaces.
	self arrangeGameTestWithOneBoardOfTwentyFiveCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test09WhenAShipMovesToTheFinalCellThenTheGameIsFished [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfFourFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.

	self assert: (aGame hasFinishedAndWinnerIs: aShip)
]

{ #category : 'tests' }
GameTest >> test10WhenAShipMovesToTheFinalCellThenTheGameIsFishedAndItCannotBeContinued [

	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOfFourFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.

	self
		should: [ aGame playturn ]
		raise: Error
		withMessageText: 'The game has finished'
]

{ #category : 'tests' }
GameTest >> test11WhenAGameIsAskedTheWhereaboutOfTheShipsThenTheGameReturnItsLaps [

	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAtLap: 2).
	self assert: (aGame theShip: aSecondShip isAtLap: 1)
]

{ #category : 'tests' }
GameTest >> test12WhenAShipDoesNotCrossTheEndThenItStaysInTheSameLap [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.
	aGame playturn.

	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test13WhenAShipMovesExactlyTheBoardSizeThenItCompletesOneLap [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfEightFaces.
	self arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAtLap: 1).
	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test14WhenAShipFallsInAWormHoleThenTheGameMovesItBackFourCells [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 6).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test15WhenAShipFallsInAWormHoleButTheCellIsLeserThanFourOnTheFirstLapThenTheGameMovesItBackToZero [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 3).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test16WhenAShipFallsInAWormHoleAndMovesToAnotherWormHoleThenSecondEffectIsNotApplied [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 6).
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 2).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test17WhenAShipFallsInAWormHoleAndGoesBackPastStartThenItLosesOneLap [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThirteenFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 3).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test18WhenAShipIsInLapOneAndFallsInAWormHoleThenItGoesBackToLapZero [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfTenFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps.
	aChargedBoard replaceACellWith: (WormHole createWithPosition: 3).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	aSecondChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice removeAll.
	aCollectionOfDice add: aSecondChargedDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test19WhenAShipFallsInMoonWalkThenItDoesNotMoveBackwards [

	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 2).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test20WhenAShipFallsInAMoonWalkTheTheEffectIsProperlyAplied [

	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 1).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.

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
	aFirstDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

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
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn. "juan -> 6, vuelta 0"
	aGame playturn. "pedro -> 6, vuelta 0"
	aGame playturn. "juan -> 2, vuelta 1"
	aGame playturn. "pedro -> 2, vuelta 1"
	aGame playturn. "juan -> 8, vuelta 1, cae en MoonWalk"

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test23WhenAShipFallsInHyperJumpThenItAdvancesTheNextParsecValueConvertedToCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

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
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 6).

	aGame playturn.
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
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 20 10 )).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 5).

	aGame playturn.
	self assert: (aGame theShip: aSecondShip isAt: 4).

	aGame playturn.
	self assert: (aGame theShip: aThirdShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test26WhenHyperJumpParsecsDoNotDivideExactlyThenItRoundsDown [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 10
		                 andAnAmountOfParcecsOf: 100.
	aChargedBoard replaceACellWith:
		(HyperJump createWithPosition: 3 andParsecs: #( 25 )).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test27WhenAShipFallsInASpeedUpThenGameMovesItForwardFourCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (SpeedUp createWithPosition: 6).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 10)
]

{ #category : 'tests' }
GameTest >> test28WhenAShipFallsInAnAtomicBombThenGameMovesItToTheFirstPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 6).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test29WhenAShipMovesToTheFinalCellThenTheGameIsFinishedAndReturnRankingswiththereStats [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aBoard aTurnManager aRanking aPositionShipManager |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withTotalNumberFaces: 4.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8
		          andAnAmountOfParcecsOf: 8.
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.

	aRanking := aGame ranking.

	self assert: (aGame hasFinishedAndWinnerIs: aShip).
	self assert: (aRanking positionOfRank: aShip) equals: 1.
	self assert: (aRanking positionOfRank: aSecondShip) equals: 2.
	self assert: (aRanking isLeader: aShip).
	self assert: aRanking orderedShips first equals: 'juan'.
	self assert: aRanking orderedShips last equals: 'fran'
]

{ #category : 'tests' }
GameTest >> test30WhenOneShipFallsInAnAtomicBombThenGameMovesTwoShipsItToTheFirstPosition [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip|
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pepe'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn. 
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 0).
	self assert: (aGame theShip: aSecondShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test31WhenAShipWantsToPlayACardandPLaysSobreCarga [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSobreCarga aCollectionOfCards |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := SobreCarga new.
	aCollectionOfCards add:aSobreCarga .
	aSecondShip := Ship createWithName: 'pepe' andWithCard:aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.
					
   aGame PayerShip:aSecondShip PlaysCard:aSobreCarga toTarget:aShip.
	aGame playturn.
	


	self assert: (aGame theShip: aShip isAt: 4).

]

{ #category : 'tests' }
GameTest >> test32WhenAShipWantsToPlayACardandPLaysSobreCargaRemain [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSobreCarga aCollectionOfCards |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := SobreCarga new.
	aCollectionOfCards add:aSobreCarga .
	aSecondShip := Ship createWithName: 'pepe' andWithCard:aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.
					
   aGame PayerShip:aSecondShip PlaysCard:aSobreCarga toTarget:aShip.
	aGame playturn.
	aGame playturn.
	aGame playturn.
	
	


	self assert: (aGame theShip: aShip isAt: 8).

]

{ #category : 'tests' }
GameTest >> test33WhenAShipWantsToPlayACardandPLaysSobreCargaRemainandanothershipaplied [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSobreCarga aCollectionOfCards |
	
	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := SobreCarga new.
	aCollectionOfCards add:aSobreCarga .
	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.
					
 	aGame PayerShip:aShip PlaysCard:aSobreCarga toTarget:aSecondShip.
	aGame PayerShip:aSecondShip PlaysCard:aSobreCarga toTarget:aShip.
	aGame playturn.
	aGame playturn.
	
	


	self assert: (aGame theShip:aShip  isAt: 4).

]

{ #category : 'tests' }
GameTest >> test34WhenAShipWantsToPlayACardandPLaysSobreCargaandItGetsRemove [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSobreCarga aCollectionOfCards |
	
	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := SobreCarga new.
	aCollectionOfCards add:aSobreCarga .
	aShip := Ship createWithName: 'juan' andWithCard:aCollectionOfCards.
	aSecondShip := Ship createWithName: 'pepe' andWithCard:aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).
	aPositionShipManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aPositionShipManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.
					
   aGame PayerShip:aSecondShip PlaysCard:aSobreCarga toTarget:aShip.
	aGame playturn.
	
	
	self assert: ((aGame Showcardsfromplayer:aSecondShip)=0).

]

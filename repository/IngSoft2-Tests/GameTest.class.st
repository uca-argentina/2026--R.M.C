Class {
	#name : 'GameTest',
	#superclass : 'TestsTools',
	#instVars : [
		'aGame',
		'aShip',
		'aSecondShip',
		'aThirdShip',
		'aCollectionOfShips',
		'aChargedDice',
		'aSecondChargedDice',
		'aCollectionOfDice',
		'aBoard',
		'aChargedBoard',
		'aShipPositionManager',
		'aTurnManager',
		'aCollectionOfCards',
		'aSecondCollectionOfCards',
		'anOverload',
		'aSpeed',
		'anAcceleration',
		'aCancellation',
		'aRedo',
		'aRepeat'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneBoardOfEightCellsEightParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 8.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndFiveLaps [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 5.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneBoardOfEightCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneBoardOfTenCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneBoardOfTwentyFiveCellsFiftyParsecsAndOneLap [

	aBoard := Board createWithATotalNumberOfCellsOf: 25 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndOneLap [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.

]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndFiveLaps [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 100.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndOneLap [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 100.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndThreeLaps [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 100.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 3.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap [

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 12 andAnAmountOfParcecsOf: 50.
	aShipPositionManager := ShipPositionManager createWith: aCollectionOfShips andNumberOfLaps: 1.
	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfEightFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 8.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfFiveFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfFourFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 4.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfSixFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfTenFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 10.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfThirteenFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 13.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOfThreeFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneShip [

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithThreeShips [

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aThirdShip := Ship createWithName: 'santi'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfShips add: aThirdShip.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoDiceOfFiveFacesAndThreeFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aCollectionOfDice add: aSecondChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoShipsAndOneCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithCard: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoShipsAndOneOfEveryCard [

	anOverload := Overload new.
	aSpeed := Speed new.
	anAcceleration := Acceleration new.
	aCancellation := Cancellation new.
	aRedo := Redo new.
	aRepeat := Repeat new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aCollectionOfCards add: aSpeed.
	aCollectionOfCards add: anAcceleration.
	aCollectionOfCards add: aCancellation.
	aCollectionOfCards add: aRedo.
	aCollectionOfCards add: aRepeat.
	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithCard: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip
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

	self arrangeGameTestWithTwoShipsAndOneCard.
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

	self arrangeGameTestWithTwoShipsAndOneCard.
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

	self arrangeGameTestWithTwoShipsAndOneCard.
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

	self arrangeGameTestWithTwoShipsAndOneCard.
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

	self arrangeGameTestWithTwoShipsAndOneCard.
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
GameTest >> test21WhenAShipFallsInAMoonWalkAndMovesAnotherShipBackwardsThenItsPositionDoesNotGoBelowZero [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test22WhenAShipFallsInAMoonWalkThenOtherShipLosesOneLap [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsFiftyParsecsAndThreeLaps.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn. "juan -> 6, vuelta 0"
	aGame playturn. "fran -> 6, vuelta 0"
	aGame playturn. "juan -> 2, vuelta 1"
	aGame playturn. "fran -> 2, vuelta 1"
	aGame playturn. "juan -> 8, vuelta 1, cae en MoonWalk"

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test23WhenAShipFallsInAHyperJumpThenItAdvancesTheNextParsecValueConvertedToCells [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndThreeLaps.
	aChargedBoard replaceACellWith: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test24WhenTwoShipsFallInAHyperJumpThenItUsesTheNextParsecValue [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndFiveLaps.
	aChargedBoard replaceACellWith: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 6).
	aGame playturn.
	self assert: (aGame theShip: aSecondShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test25WhenAShipFallsInAHyperJumpAndUsesAllParsecValuesThenItStartsAgainFromTheBeginning [

	self arrangeGameTestWithThreeShips.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndFiveLaps.
	aChargedBoard replaceACellWith: (HyperJump createWithPosition: 3 andParsecs: #( 20 10 )).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
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
GameTest >> test26WhenAShipFallsInAHyperJumpAndParsecsDoNotDivideToAnExactIntegerThenItRoundsDown [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfThreeFaces.
	self arrangeGameTestWithOneChargedBoardOfTenCellsOneHundredParsecsAndOneLap.
	aChargedBoard replaceACellWith: (HyperJump createWithPosition: 3 andParsecs: #( 25 )).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test27WhenAShipFallsInASpeedUpThenTheGameMovesItForwardFourCells [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (SpeedUp createWithPosition: 6).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 10)
]

{ #category : 'tests' }
GameTest >> test28WhenAShipFallsInAnAtomicBombThenTheGameMovesItToTheFirstPosition [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 6).

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
GameTest >> test29WhenOneShipFallsInAnAtomicBombThenTheGameMovesTwoShipsToTheFirstPosition [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
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
GameTest >> test30WhenAShipMovesToTheFinalCellThenTheGameIsFinishedAndReturnsARankingWithStats [

	| aRanking |
	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfFourFaces.
	self arrangeGameTestWithOneBoardOfEightCellsEightParsecsAndOneLap.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
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
GameTest >> test31WhenAShipWantsToPlayACardandPLaysSobreCarga [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSobreCarga aCollectionOfCards |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := Overload new.
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
	aSobreCarga := Overload new.
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
	aSobreCarga := Overload new.
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
GameTest >> test34WhenAShipWantsToPlayACardAndPlaysOverloadThenItGetsRemoved [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: anOverload toTarget: aShip.
	aGame playturn.

	self assert: (aGame Showcardsfromplayer: aSecondShip) = 0
]

{ #category : 'tests' }
GameTest >> test35WhenAccelerationIsPlayedAllShipsMoveExtraOnNextTurn [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip aAcceleration aCollectionOfCards |
	aShip := Ship
		         createWithName: 'juan'
		         andWithCard: OrderedCollection new.
	aCollectionOfCards := OrderedCollection new.
	aAcceleration := Acceleration new.
	aCollectionOfCards add: aAcceleration.
	aSecondShip := Ship
		               createWithName: 'pepe'
		               andWithCard: aCollectionOfCards.
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

	aGame PayerShip: aSecondShip PlaysCard: aAcceleration toTarget: #all.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 7).
	self assert: (aGame theShip: aSecondShip isAt: 7)
]

{ #category : 'tests' }
GameTest >> test36WhenAShipWantsToPlayACardandPLaysSpeeds [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aSecondShip  aSpeed aCollectionOfCards |
	aShip := Ship createWithName: 'juan'.
	aCollectionOfCards := OrderedCollection new.
	aSpeed:= Speed new.
	aCollectionOfCards add:aSpeed .
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
					
   aGame PayerShip:aSecondShip PlaysCard:aSpeed toTarget:aShip.
	aGame playturn.
	


	self assert: (aGame theShip: aShip isAt: 7).

]

{ #category : 'tests' }
GameTest >> test37WhenAShipCancelsAnOverloadCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran applies Overload penalty to juan"
	aGame PayerShip: aSecondShip PlaysCard: anOverload toTarget: aShip.
	"juan cancels the Overload applied to himself"
	aCancellation targeting: anOverload.
	aGame PayerShip: aShip PlaysCard: aCancellation toTarget: aShip.
	"juan plays turn → dice=6, no penalty → moves 6"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test38WhenAShipCancelsASpeedCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran applies Speed modifier to juan"
	aGame PayerShip: aSecondShip PlaysCard: aSpeed toTarget: aShip.
	"juan cancels the Speed modifier applied to himself"
	aCancellation targeting: aSpeed.
	aGame PayerShip: aShip PlaysCard: aCancellation toTarget: aShip.
	"juan plays turn → dice=6, no penalty → moves 6"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test39WhenAShipCancelsAnAccelerationCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran applies Acceleration penalty to juan"
	aGame PayerShip: aSecondShip PlaysCard: anAcceleration toTarget: #all.
	"juan cancels the Acceleration applied to everyone"
	aCancellation targeting: anAcceleration.
	aGame PayerShip: aShip PlaysCard: aCancellation toTarget: aShip.
	"juan plays turn → dice=6, no penalty → moves 6"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test40WhenAShipPlaysARedoCardThenItRepeatsTheLastOverloadCard [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran plays Overload on juan → juan gets -2"
	aGame PayerShip: aSecondShip PlaysCard: anOverload toTarget: aShip.
	"fran plays Redo also targeting juan → juan gets another -2"
	aGame PayerShip: aSecondShip PlaysCard: aRedo toTarget: aShip.
	"juan plays → dice=6, two penalties of -2 = moves 2"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test41WhenAShipPlaysARedoCardThenItRepeatsTheLastSpeedCard [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran plays Speed on juan → juan gets +1"
	aGame PayerShip: aSecondShip PlaysCard: aSpeed toTarget: aShip.
	"fran plays Redo also targeting juan → juan gets another +1"
	aGame PayerShip: aSecondShip PlaysCard: aRedo toTarget: aShip.
	"juan plays → dice=6, two modifiers of +1 = moves 8"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test42WhenAShipPlaysARedoCardThenItRepeatsTheLastAccelerationCard [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOfSixFaces.
	self arrangeGameTestWithOneChargedBoardOfTwelveCellsFiftyParsecsAndOneLap.
	aChargedBoard replaceACellWith: (AtomicBomb createWithPosition: 12).

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice.

	"fran plays Acceleration on everyone → juan gets +1"
	aGame PayerShip: aSecondShip PlaysCard: anAcceleration toTarget: aShip.
	"fran plays Redo also targeting everyone → juan gets another +1"
	aGame PayerShip: aSecondShip PlaysCard: aRedo toTarget: aShip.
	"juan plays → dice=6, two modifiers of +1 = moves 8"
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test43WhenAShipPlaysRepeatAndNobodyRolledTheDiceThenItDoesNothing [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard
	  aPositionShipManager aTurnManager aRepeat
	  aCollectionOfCardsForJuan |

	aRepeat := Repeat new.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aCollectionOfCardsForJuan add: aRepeat.

	aShip := Ship
		createWithName: 'juan'
		andWithCard: aCollectionOfCardsForJuan.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 12
		andAnAmountOfParcecsOf: 50.

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

	aGame PayerShip: aShip PlaysCard: aRepeat toTarget: aShip.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test44WhenAShipPlaysRepeatAfterADiceRollThenItRepeatsTheLastMovementEffect [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard
	  aPositionShipManager aTurnManager aRepeat
	  aCollectionOfCardsForJuan |

	aRepeat := Repeat new.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aCollectionOfCardsForJuan add: aRepeat.

	aShip := Ship
		createWithName: 'juan'
		andWithCard: aCollectionOfCardsForJuan.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 12
		andAnAmountOfParcecsOf: 50.

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

	self assert: (aGame theShip: aShip isAt: 3).

	aGame PayerShip: aShip PlaysCard: aRepeat toTarget: aShip.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test45WhenAnotherEffectIsAppliedThenRepeatUsesTheNewLastEffect [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard aPositionShipManager aTurnManager aRepeat aSecondRepeat aCollectionOfCardsForJuan |
	aRepeat := Repeat new.
	aSecondRepeat := Repeat new.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aCollectionOfCardsForJuan add: aRepeat.
	aCollectionOfCardsForJuan add: aSecondRepeat.

	aShip := Ship
		         createWithName: 'juan'
		         andWithCard: aCollectionOfCardsForJuan.

	aSecondShip := Ship
		               createWithName: 'pepe'
		               andWithCard: OrderedCollection new.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		                 createWithATotalNumberOfCellsOf: 12
		                 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith: (WormHole createWithPosition: 6).

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
	self assert: (aGame theShip: aShip isAt: 3).


	aGame PayerShip: aShip PlaysCard: aRepeat toTarget: aSecondShip.
	self assert: (aGame theShip: aSecondShip isAt: 3).

	aGame playturn.
	self assert: (aGame theShip: aSecondShip isAt: 2).

	aGame PayerShip: aShip PlaysCard: aSecondRepeat toTarget: aShip.
	self assert: (aGame theShip: aShip isAt: 2)
]

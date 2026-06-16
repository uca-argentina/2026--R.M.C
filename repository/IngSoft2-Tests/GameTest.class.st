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
GameTest >> arrangeGameTestWithBoardOf: aNumberOfCells parsecs: anAmountOfParsecs laps: anAmountOfLaps [

	aBoard := Board
		          createWithATotalNumberOfCellsOf: aNumberOfCells
		          andAnAmountOfParcecsOf: anAmountOfParsecs
		          using: (ChargedCellGenerator forBoardOfSize: aNumberOfCells).

	aShipPositionManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: anAmountOfLaps.

	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithBoardOf: aNumberOfCells parsecs: anAmountOfParsecs laps: anAmountOfLaps charging: aCell at: aPosition [

	| generator |
	generator := ChargedCellGenerator forBoardOfSize: aNumberOfCells.
	generator put: aCell at: aPosition.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: aNumberOfCells
		          andAnAmountOfParcecsOf: anAmountOfParsecs
		          using: generator.

	aShipPositionManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: anAmountOfLaps.

	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithBoardOf: aNumberOfCells parsecs: anAmountOfParsecs laps: anAmountOfLaps chargingCells: aCollectionOfCells [

	| generator |
	generator := ChargedCellGenerator forBoardOfSize: aNumberOfCells.
	aCollectionOfCells do: [ :cell | generator put: cell at: cell numberOfCell ].

	aBoard := Board
		          createWithATotalNumberOfCellsOf: aNumberOfCells
		          andAnAmountOfParcecsOf: anAmountOfParsecs
		          using: generator.

	aShipPositionManager := ShipPositionManager
		                        createWith: aCollectionOfShips
		                        andNumberOfLaps: anAmountOfLaps.

	aTurnManager := TurnManager creatWith: aCollectionOfShips.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection with: anOverload.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneDieOf: aNumberOfFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: aNumberOfFaces.
	aCollectionOfDice := OrderedCollection with: aChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneOfEveryCard [

	anOverload := Overload new.
	aSpeed := Speed new.
	anAcceleration := Acceleration new.
	aCancellation := Cancellation new.
	aRedo := Redo new.
	aRepeat := Repeat new.
	aCollectionOfCards := OrderedCollection with: anOverload with: aSpeed with: anAcceleration with: aCancellation with: aRedo with: aRepeat.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithOneShip [

	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection with: aShip.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithThreeShips [

	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithACollectionOfCards: aCollectionOfCards.
	aThirdShip := Ship createWithName: 'santi' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection with: aShip with: aSecondShip with: aThirdShip.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoDiceOf: aNumberOfFaces and: anotherNumberOfFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: aNumberOfFaces.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: anotherNumberOfFaces.
	aCollectionOfDice := OrderedCollection with: aChargedDice with: aSecondChargedDice.
]

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoShips [

	aShip := Ship createWithName: 'juan' andWithACollectionOfCards: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithACollectionOfCards: aCollectionOfCards.
	aCollectionOfShips := OrderedCollection with: aShip with: aSecondShip.
]

{ #category : 'tests' }
GameTest >> test01WhenAGameStartsThenItReturnsItsName [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 5.
	self arrangeGameTestWithBoardOf: 25 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 5.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 5.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 5.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithTwoDiceOf: 5 and: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	aCollectionOfDice := OrderedCollection new.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 4.
	self arrangeGameTestWithBoardOf: 25 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 4.
	self arrangeGameTestWithBoardOf: 8 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 4.
	self arrangeGameTestWithBoardOf: 8 parsecs: 50 laps: 1.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 8 parsecs: 50 laps: 5.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 8 parsecs: 50 laps: 5.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 8.
	self arrangeGameTestWithBoardOf: 8 parsecs: 50 laps: 5.

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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1 charging: (WormHole createWithPosition: 6) at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test15WhenAShipFallsInAWormHoleButTheCellIsLeserThanFourOnTheFirstLapThenTheGameMovesItBackToZero [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1 charging: (WormHole createWithPosition: 3) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test16WhenAShipFallsInAWormHoleAndMovesToAnotherWormHoleThenSecondEffectIsNotApplied [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1 chargingCells: {
			WormHole createWithPosition: 6.
			WormHole createWithPosition: 2 }.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test17WhenAShipFallsInAWormHoleAndGoesBackPastStartThenItLosesOneLap [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 13.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1 charging: (WormHole createWithPosition: 3) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test18WhenAShipIsInLapOneAndFallsInAWormHoleThenItGoesBackToLapZero [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 10.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 3 charging: (WormHole createWithPosition: 3) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 1 charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 2) at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test20WhenAShipFallsInAMoonWalkTheTheEffectIsProperlyAplied [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 3 charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 1)at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test21WhenAShipFallsInAMoonWalkAndMovesAnotherShipBackwardsThenItsPositionDoesNotGoBelowZero [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 3 charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3)at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test22WhenAShipFallsInAMoonWalkThenOtherShipLosesOneLap [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 10 parsecs: 50 laps: 3 charging: (MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4) at: 8.

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

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test23WhenAShipFallsInAHyperJumpThenItAdvancesTheNextParsecValueConvertedToCells [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 100 laps: 3 charging: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aShip isAtLap: 0)
]

{ #category : 'tests' }
GameTest >> test24WhenTwoShipsFallInAHyperJumpThenItUsesTheNextParsecValue [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 100 laps: 5 charging: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 6).

	aGame playturn.
	self assert: (aGame theShip: aSecondShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test25WhenAShipFallsInAHyperJumpAndUsesAllParsecValuesThenItStartsAgainFromTheBeginning [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithThreeShips.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 100 laps: 5 charging: (HyperJump createWithPosition: 3 andParsecs: #( 20 10 )) at:3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
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

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 10 parsecs: 100 laps: 1 charging: (HyperJump createWithPosition: 3 andParsecs: #( 25 )) at:3.

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
GameTest >> test27WhenAShipFallsInASpeedUpThenTheGameMovesItForwardFourCells [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging: (SpeedUp createWithPosition: 6) at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 10)
]

{ #category : 'tests' }
GameTest >> test28WhenAShipFallsInAnAtomicBombThenTheGameMovesItToTheFirstPosition [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging: (AtomicBomb createWithPosition: 6) at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test29WhenOneShipFallsInAnAtomicBombThenTheGameMovesTwoShipsToTheFirstPosition [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
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
	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 4.
	self arrangeGameTestWithBoardOf: 8 parsecs: 8 laps: 1.

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
GameTest >> test31WhenAShipPlaysAnOverloadCardThenTheOtherShipsIsAffectedAtItsNextTurn [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 4)
]

{ #category : 'tests' }
GameTest >> test32WhenAShipPlaysAnOverloadCardThenTheOtherShipIsAffectedPermanently [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aGame playturn.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test33WhenTwoShipsPlayAnOverloadCardAgainstEachOtherThenBothAreAffected [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aShip playsCard: anOverload toTarget: aSecondShip.
	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 4)
]

{ #category : 'tests' }
GameTest >> test34WhenAShipPlaysAnOverloadCardThenItGetsRemovedFromThatShipsCardCollection [

	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aGame playturn.

	self assert: (aGame showCardsFromPlayer: aSecondShip) = 0
]

{ #category : 'tests' }
GameTest >> test35WhenAccelerationIsPlayedAllShipsMoveExtraOnNextTurn [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anAcceleration toTarget: #all.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 7).
	self assert: (aGame theShip: aSecondShip isAt: 7)
]

{ #category : 'tests' }
GameTest >> test36WhenAShipWantsToPlayACardandPLaysSpeeds [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: aSpeed toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 7)
]

{ #category : 'tests' }
GameTest >> test37WhenAShipCancelsAnOverloadCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aCancellation targeting: anOverload.
	aGame playerShip: aShip playsCard: aCancellation toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test38WhenAShipCancelsASpeedCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: aSpeed toTarget: aShip.
	aCancellation targeting: aSpeed.
	aGame playerShip: aShip playsCard: aCancellation toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test39WhenAShipCancelsAnAccelerationCardThenThePenaltyIsRemoved [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anAcceleration toTarget: #all.
	aCancellation targeting: anAcceleration.
	aGame playerShip: aShip playsCard: aCancellation toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test40WhenAShipPlaysARedoCardThenItRepeatsTheLastOverloadCard [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	aGame playerShip: aSecondShip playsCard: aRedo toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test41WhenAShipPlaysARedoCardThenItRepeatsTheLastSpeedCard [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: aSpeed toTarget: aShip.
	aGame playerShip: aSecondShip playsCard: aRedo toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test42WhenAShipPlaysARedoCardThenItRepeatsTheLastAccelerationCard [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anAcceleration toTarget: aShip.
	aGame playerShip: aSecondShip playsCard: aRedo toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test43WhenAShipPlaysRepeatAndNobodyRolledTheDiceThenItDoesNothing [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aShip playsCard: aRepeat toTarget: aShip.
	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test44WhenAShipPlaysRepeatAfterADiceRollThenItRepeatsTheLastMovementEffect [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 3).

	aGame playerShip: aShip playsCard: aRepeat toTarget: aShip.
	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test45WhenAnotherEffectIsAppliedThenRepeatUsesTheNewLastEffect [

	| aSecondRepeat |
	aSecondRepeat := Repeat new.
	self arrangeGameTestWithOneOfEveryCard.
	aCollectionOfCards add: aSecondRepeat.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 3.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging: (WormHole createWithPosition: 6) at: 6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 3).

	aGame playerShip: aShip playsCard: aRepeat toTarget: aSecondShip.
	self assert: (aGame theShip: aSecondShip isAt: 3).

	aGame playturn.
	self assert: (aGame theShip: aSecondShip isAt: 2).

	aGame playerShip: aShip playsCard: aSecondRepeat toTarget: aShip.
	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test46WhenAShipPlaysARedoCardButNoCardsWerePlayedBeforeThenItFails [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self
		should: [ aGame playerShip: aSecondShip playsCard: aRedo toTarget: aShip ]
		raise: Error
		withMessageText: 'The redo must be played after another card'
]

{ #category : 'tests' }
GameTest >> test47WhenACancellationCardHasNoTargetThenItFails [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	self
		should: [ aGame playerShip: aShip playsCard: aCancellation toTarget: aShip ]
		raise: Error
		withMessageText: 'The cancellation must have a target card to cancel'
]

{ #category : 'tests' }
GameTest >> test48WhenAShipTriesToPlayTheSameCardTwiceThenItFails [

	self arrangeGameTestWithOneOfEveryCard.
	self arrangeGameTestWithTwoShips.
	self arrangeGameTestWithOneDieOf: 6.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip.
	self
		should: [ aGame playerShip: aSecondShip playsCard: anOverload toTarget: aShip ]
		raise: Error
		withMessageText: 'Ship does not have that card'
]

{ #category : 'tests' }
GameTest >> test49WhenAShipFallsInACardDealerCellThenItReceivesACard [

	| aCardGenerator |
	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	aSpeed := Speed new.
	aCardGenerator := ChargedDeck with: aSpeed.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging: (CardDealerCell createWithPosition: 3 andCardGenerator: aCardGenerator) at: 3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	self assert: (aGame showCardsFromPlayer: aShip) equals: 1.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 3).
	self assert: (aGame showCardsFromPlayer: aShip) equals: 2
]

{ #category : 'tests' }
GameTest >> test50WhenAShipUsesTheCardGivenByCardDealerCellThenTheCardIsRemovedFromHand [

	| aCardGenerator |
	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	aSpeed := Speed new.
	aCardGenerator := ChargedDeck with: aSpeed.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging:
			(CardDealerCell createWithPosition: 3 andCardGenerator: aCardGenerator) at: 3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame showCardsFromPlayer: aShip) equals: 2.

	aGame playerShip: aShip playsCard: aSpeed toTarget: aShip.
	self assert: (aGame showCardsFromPlayer: aShip) equals: 1
]

{ #category : 'tests' }
GameTest >> test51WhenAShipUsesTheSpeedCardGivenByCardDealerCellThenItsNextMovementIsIncreased [

	| aCardGenerator |
	self arrangeGameTestWithOneCard.
	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.
	aSpeed := Speed new.
	aCardGenerator := ChargedDeck with: aSpeed.
	self arrangeGameTestWithBoardOf: 12 parsecs: 50 laps: 1 charging:
			(CardDealerCell createWithPosition: 3 andCardGenerator: aCardGenerator) at: 3.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 3).

	aGame playerShip: aShip playsCard: aSpeed toTarget: aShip.
	aGame playturn.
	self assert: (aGame theShip: aShip isAt: 7)
]

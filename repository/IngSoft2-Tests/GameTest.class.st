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

	aCollectionOfCells do: [ :cell |
		generator put: cell at: cell numberOfCell ].

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
GameTest >> arrangeGameTestWithOneDieOf: aNumberOfFaces [

	aChargedDice := ChargedDice withTotalNumberFaces: aNumberOfFaces.

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

{ #category : 'tests - initial state' }
GameTest >> arrangeGameTestWithTwoShipsAndOneOverloadCardAndOneCancellationCard [

	anOverload := Overload new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: anOverload.
	aCancellation := Overload new.
	aSecondCollectionOfCards := OrderedCollection new.
	aSecondCollectionOfCards add: anOverload.
	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'fran' andWithCard: aSecondCollectionOfCards.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip
]

{ #category : 'tests' }
GameTest >> test01WhenAGameStartsThenItReturnsItsName [

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 5.

	self
		arrangeGameTestWithBoardOf: 25
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 5.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 5.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 5.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 4.

	self
		arrangeGameTestWithBoardOf: 25
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 4.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 4.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 50
		laps: 1.

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
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 50
		laps: 5.

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
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 50
		laps: 5.

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
	self arrangeGameTestWithOneDieOf: 8.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 50
		laps: 5.

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
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1
		charging: (WormHole createWithPosition: 6) at:6.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1
		charging: (WormHole createWithPosition: 3) at:3.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1
		chargingCells: {
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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 13.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1
		charging: (WormHole createWithPosition: 3) at:3.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 10.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 3
		charging: (WormHole createWithPosition: 3) at:3.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 1
		charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 2) at:6.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 3
		charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 1)at:6.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 3
		charging: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3)at:6.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 50
		laps: 3
		charging: (MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4)at:8.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
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
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 100
		laps: 3
		charging: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )) at:3.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 100
		laps: 5
		charging: (HyperJump createWithPosition: 3 andParsecs: #( 30 20 10 )) at:3.

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

	self arrangeGameTestWithThreeShips.
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 100
		laps: 5
		charging: (HyperJump createWithPosition: 3 andParsecs: #( 20 10 )) at:3.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 10
		parsecs: 100
		laps: 1
		charging: (HyperJump createWithPosition: 3 andParsecs: #( 25 )) at:3.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (SpeedUp createWithPosition: 6) at:6.

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

	self arrangeGameTestWithOneShip.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 6) at:6.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

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

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 4.

	self
		arrangeGameTestWithBoardOf: 8
		parsecs: 8
		laps: 1.

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

	| aSobreCarga aCollectionOfCards |

	self arrangeGameTestWithOneDieOf: 6.

	aShip := Ship createWithName: 'juan'.

	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := Overload new.
	aCollectionOfCards add: aSobreCarga.

	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: aSobreCarga toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 4)
]

{ #category : 'tests' }
GameTest >> test32WhenAShipWantsToPlayACardandPLaysSobreCargaRemain [

	| aSobreCarga aCollectionOfCards |

	self arrangeGameTestWithOneDieOf: 6.

	aShip := Ship createWithName: 'juan'.

	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := Overload new.
	aCollectionOfCards add: aSobreCarga.

	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: aSobreCarga toTarget: aShip.
	aGame playturn.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test33WhenAShipWantsToPlayACardandPLaysSobreCargaRemainandanothershipaplied [

	| aSobreCarga aCollectionOfCards |

	aCollectionOfCards := OrderedCollection new.
	aSobreCarga := Overload new.
	aCollectionOfCards add: aSobreCarga.

	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCards.
	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aShip PlaysCard: aSobreCarga toTarget: aSecondShip.
	aGame PayerShip: aSecondShip PlaysCard: aSobreCarga toTarget: aShip.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 4)
]

{ #category : 'tests' }
GameTest >> test34WhenAShipWantsToPlayACardAndPlaysOverloadThenItGetsRemoved [

	self arrangeGameTestWithTwoShipsAndOneCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: anOverload toTarget: aShip.
	aGame playturn.

	self assert: (aGame Showcardsfromplayer: aSecondShip) = 0
]

{ #category : 'tests' }
GameTest >> test35WhenAccelerationIsPlayedAllShipsMoveExtraOnNextTurn [

	| aAcceleration aCollectionOfCards |

	aShip := Ship createWithName: 'juan' andWithCard: OrderedCollection new.

	aCollectionOfCards := OrderedCollection new.
	aAcceleration := Acceleration new.
	aCollectionOfCards add: aAcceleration.

	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: aAcceleration toTarget: #all.
	aGame playturn.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 7).
	self assert: (aGame theShip: aSecondShip isAt: 7)
]

{ #category : 'tests' }
GameTest >> test36WhenAShipWantsToPlayACardandPLaysSpeeds [

	| aSpeed aCollectionOfCards |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfCards := OrderedCollection new.
	aSpeed := Speed new.
	aCollectionOfCards add: aSpeed.

	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCards.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12)at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: aSpeed toTarget: aShip.
	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 7)
]

{ #category : 'tests' }
GameTest >> test37WhenAShipCancelsAnOverloadCardThePenaltyIsRemoved [

	self arrangeGameTestWithTwoShipsAndOneOfEveryCard.
	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12)at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: anOverload toTarget: aShip.

	aCancellation targeting: anOverload.
	aGame PayerShip: aShip PlaysCard: aCancellation toTarget: aShip.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test40WhenAShipPlaysRedoItRepeatsTheLastPlayedCard [

	| aSobreCarga aRedo aCollectionOfCardsForJuan aCollectionOfCardsForPepe |

	aSobreCarga := Overload new.
	aRedo := Redo new.

	aCollectionOfCardsForPepe := OrderedCollection new.
	aCollectionOfCardsForPepe add: aSobreCarga.
	aCollectionOfCardsForPepe add: aRedo.
	aSecondShip := Ship createWithName: 'pepe' andWithCard: aCollectionOfCardsForPepe.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aShip := Ship createWithName: 'juan' andWithCard: aCollectionOfCardsForJuan.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (AtomicBomb createWithPosition: 12) at:12.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aSecondShip PlaysCard: aSobreCarga toTarget: aShip.
	aGame PayerShip: aSecondShip PlaysCard: aRedo toTarget: aShip.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 2)
]

{ #category : 'tests' }
GameTest >> test41WhenAShipPlaysRepeatAndNobodyRolledTheDiceThenItDoesNothing [

	| aRepeat aCollectionOfCardsForJuan |

	aRepeat := Repeat new.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aCollectionOfCardsForJuan add: aRepeat.

	aShip := Ship
		         createWithName: 'juan'
		         andWithCard: aCollectionOfCardsForJuan.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	self arrangeGameTestWithOneDieOf: 6.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame PayerShip: aShip PlaysCard: aRepeat toTarget: aShip.

	self assert: (aGame theShip: aShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test42WhenAShipPlaysRepeatAfterADiceRollThenItRepeatsTheLastMovementEffect [

	| aRepeat aCollectionOfCardsForJuan |

	aRepeat := Repeat new.

	aCollectionOfCardsForJuan := OrderedCollection new.
	aCollectionOfCardsForJuan add: aRepeat.

	aShip := Ship
		         createWithName: 'juan'
		         andWithCard: aCollectionOfCardsForJuan.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
		         andADice: aCollectionOfDice.

	aGame playturn.

	self assert: (aGame theShip: aShip isAt: 3).

	aGame PayerShip: aShip PlaysCard: aRepeat toTarget: aShip.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test43WhenAnotherEffectIsAppliedThenRepeatUsesTheNewLastEffect [

	| aRepeat aSecondRepeat aCollectionOfCardsForJuan |

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

	self arrangeGameTestWithOneDieOf: 3.

	self
		arrangeGameTestWithBoardOf: 12
		parsecs: 50
		laps: 1
		charging: (WormHole createWithPosition: 6) at:6.

	aGame := Game
		         createWithName: 'Ludo'
		         andAShipPositionManager: aShipPositionManager
		         andATurnManager: aTurnManager
		         andABord: aBoard
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

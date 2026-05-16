Class {
	#name : 'GameTest',
	#superclass : 'TestsTools',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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
		          createWithATotalNumberOfCellsOf: 12 andAnAmountOfParcecsOf: 50.
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
	aChargedDice := ChargedDice withTotalNumberFaces: 5 .

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aBoard := Board
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
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
GameTest >> test08whenAGameMovesTwoShipsTwiceThenTheShipsMovesToTheCells [

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
		          createWithATotalNumberOfCellsOf: 25 andAnAmountOfParcecsOf: 50.
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
GameTest >> test09whenAShipMovesToTheFinalCellThenTheGameIsFished [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |
	aShip := Ship createWithName: 'juan'.


	aChargedDice := ChargedDice withTotalNumberFaces: 4.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.


	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board
		          createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
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
GameTest >> test10whenAShipMovesToTheFinalCellThenTheGameIsFishedAndItCannotBeContinued [

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
		          createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
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
		should: [ aGame moves ]
		raise: Error
		withMessageText: 'The game has finished'
]

{ #category : 'tests' }
GameTest >> test11WhenInAGameWeAskWhereTheShipsAreThenTheGAmeReturnItsLaps [

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
		          createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.
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
GameTest >> test12WhenShipDoesNotCrossTheEndThenItStaysInSameLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |

	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.

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
GameTest >> test13WhenShipMovesExactlyBoardSizeThenItCompletesOneLap [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aBoard |

	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 8.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aBoard := Board createWithATotalNumberOfCellsOf: 8 andAnAmountOfParcecsOf: 50.

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
GameTest >> test14WhenAShipFallsInAWormHoleThenGameMovesItBackFourCells [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged 
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition:6).

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 2).
]

{ #category : 'tests' }
GameTest >> test15WhenAShipFallsInAWormHoleInTwoThenGameMovesItBackToZero [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged 
		          createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (WhromHole createWithPosition:3).

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABord: aChargedBoard
		         andADice: aCollectionOfDice
				   andNumberOfLaps:1 .

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 0).
]

{ #category : 'tests' }
GameTest >> test16WhenAShipFallsInAWormHoleAndMovesToAnotherWormHoleThenSecondEffectIsNotApplied [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6 .

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 6).
	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 2).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 1.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 2).
]

{ #category : 'tests' }
GameTest >> test17WhenAShipFallsInAWormHoleAndGoesBackPastStartThenItLosesOneLap [

	| aGame aShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 13.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 3).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0).
]

{ #category : 'tests' }
GameTest >> test18WhenAShipIsInLapOneAndFallsInAWormHoleThenItGoesBackToLapZero [

	| aGame aShip aCollectionOfShips aCollectionOfDice aFirstDice aSecondDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aFirstDice := ChargedDice withTotalNumberFaces: 10.
	aSecondDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith: (WhromHole createWithPosition: 3).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves.

	aCollectionOfDice removeAll.
	aCollectionOfDice add: aSecondDice.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 9).
	self assert: (aGame theShip: aShip isAtLap: 0).
]

{ #category : 'tests' }
GameTest >> test19WhenAShipFallsInMoonWalkThenItDoesNotMoveBackwards [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aFirstDice := ChargedDice withTotalNumberFaces: 6 .

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 2).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test20whenAShipFallsInAMoonWalkCellTheTheEffectIsCorrectlyAplied [

	| aGame aShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard aSecondShip |

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip .

	aFirstDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 1).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves.
	aGame moves.
	aGame moves.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 2).
]

{ #category : 'tests' }
GameTest >> test21WhenMoonWalkMovesAnotherShipBackwardsThenPositionDoesNotGoBelowZero [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aFirstDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.
	

	aFirstDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aFirstDice.

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.
	aChargedBoard replaceACellWith: (MoonWalk createWithPosition: 6 withBackwardsMovementOf: 3).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 0)
]

{ #category : 'tests' }
GameTest >> test22WhenAShipFallsInMoonWalkThenOtherShipLosesOneLap [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged
		createWithATotalNumberOfCellsOf: 10 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves. "juan -> 6, vuelta 0"
	aGame moves. "pedro -> 6, vuelta 0"
	aGame moves. "juan -> 2, vuelta 1"
	aGame moves. "pedro -> 2, vuelta 1"
	aGame moves. "juan -> 8, vuelta 1, cae en MoonWalk"

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0).
]

{ #category : 'tests' }
GameTest >> test23 [

	| aGame aShip aSecondShip aCollectionOfShips aCollectionOfDice aChargedDice aChargedBoard |

	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'pedro'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aChargedDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aChargedBoard := BoardCharged createWithATotalNumberOfCellsOf: 10
						 andAnAmountOfParcecsOf: 50.

	aChargedBoard replaceACellWith:
		(MoonWalk createWithPosition: 8 withBackwardsMovementOf: 4).

	aGame := Game
		createWithName: 'Ludo'
		andShips: aCollectionOfShips
		andABord: aChargedBoard
		andADice: aCollectionOfDice
		andNumberOfLaps: 3.

	aGame moves. "juan -> 6, vuelta 0"
	aGame moves. "pedro -> 6, vuelta 0"
	aGame moves. "juan -> 2, vuelta 1"
	aGame moves. "pedro -> 2, vuelta 1"
	aGame moves. "juan -> 8, vuelta 1, cae en MoonWalk"

	self assert: (aGame theShip: aSecondShip isAt: 8).
	self assert: (aGame theShip: aSecondShip isAtLap: 0).
]

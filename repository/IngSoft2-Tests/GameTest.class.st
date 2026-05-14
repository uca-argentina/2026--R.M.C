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

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice.
	self assert: aGame start equals: 'Ludo'
]

{ #category : 'tests' }
GameTest >> test02whenAGameStartsWithASpecificNameThenItKnowsItsName [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Generala'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice.
	self assert: aGame start equals: 'Generala'
]

{ #category : 'tests' }
GameTest >> test03whenTheGameAdvanceATurnThenTheShipsPositionChanges [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aLapManager|
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 3.
	

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
 
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aLapManager:= Lapmanager CreatWith: aCollectionOfShips.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice
		         andALapManager:aLapManager.

	aGame moves.
	self assert: (aGame theShip: aShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test04whenAGameCreatesAnNSizeBoardThenTheBoardInTheGameHasNCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice |
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice.

	self assert: aGame boardSize equals: 10
]

{ #category : 'tests' }
GameTest >> test05whenAGameThrowsTheDiceToMoveAShipThenTheShipMovesToTheCell [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aLapManager|
	aShip := Ship createWithName: 'juan'.
	aChargedDice := ChargedDice withTotalNumberFaces: 5.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
   aLapManager:= Lapmanager CreatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice
					andALapManager:aLapManager.

	aGame moves.

	self assert: (aGame theShip: aShip isAt: 5)
]

{ #category : 'tests' }
GameTest >> test06whenAGameThrowsNDicesToMoveAShipThenTheShipMovesToTheSumOfTheDices [

	| aGame aShip aCollectionOfShips aChargedDice aSecondChargedDice aCollectionOfDice aLapManager|
	aShip := Ship createWithName: 'juan'.

	aChargedDice := ChargedDice withTotalNumberFaces: 5.
	aSecondChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aSecondChargedDice.
	aCollectionOfDice add: aChargedDice.
	 aLapManager:= Lapmanager CreatWith: aCollectionOfShips.
	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 10
		         andADice: aCollectionOfDice
					andALapManager:aLapManager.

	aGame moves.
	self assert: (aGame theShip: aShip isAt: 8)
]

{ #category : 'tests' }
GameTest >> test07whenAGameHasAnEmptyDicesCollectionThenTheCreationFails [

	| aShip aCollectionOfShips aCollectionOfDice |
	aShip := Ship createWithName: 'juan'.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.

	aCollectionOfDice := OrderedCollection new.

	self
		should: [
				Game
					createWithName: 'Ludo'
					andShips: aCollectionOfShips
					andABordOf: 10
					andADice: aCollectionOfDice ]
		raise: Error
		withMessageText: 'There must be one dice in the game'
]

{ #category : 'tests' }
GameTest >> test08whenTheSumOfTheDicesIsHigherThatTheAmountOfCellsThenTheCreationFails [

	| aShip aCollectionOfShips aChargedDice aSecondChargedDice aCollectionOfDice |
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
				Game
					createWithName: 'Ludo'
					andShips: aCollectionOfShips
					andABordOf: 10
					andADice: aCollectionOfDice ]
		raise: Error
		withMessageText:
		'There of the dices must be lower than the amount of cells'
]

{ #category : 'tests' }
GameTest >> test09whenAGameMovesTwoShipsThenThesShipsMovesToTheCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.

	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 15
		         andADice: aCollectionOfDice.

	aGame moves.
	aGame moves.

	self assert: (aGame theShip: aShip isAt: 3).
	self assert: (aGame theShip: aSecondShip isAt: 3)
]

{ #category : 'tests' }
GameTest >> test10whenAGameMovesTwoShipsTwiceThenTheShipsMovesToTheCells [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.

	aChargedDice := ChargedDice withTotalNumberFaces: 3.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 15
		         andADice: aCollectionOfDice.

	aGame moves.
	aGame moves.
	aGame moves.
	aGame moves.

	self assert: (aGame theShip: aShip isAt: 6).
	self assert: (aGame theShip: aSecondShip isAt: 6)
]

{ #category : 'tests' }
GameTest >> test11whenAShipMovesToTheFinalCellThenTheGameIsFished [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice |
	aShip := Ship createWithName: 'juan'.


	aChargedDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.


	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 12
		         andADice: aCollectionOfDice.

	aGame moves.
	aGame moves.


	self assert: (aGame hasFinishedAndWinnerIs: aShip)
]

{ #category : 'tests' }
GameTest >> test12whenAShipMovesToTheFinalCellThenTheGameIsFishedAndItCannotBeContinued [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip |
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.


	aChargedDice := ChargedDice withTotalNumberFaces: 6.

	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.


	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 12
		         andADice: aCollectionOfDice.

	aGame moves.
	aGame moves.
	aGame moves.

	self
		should: [ aGame moves ]
		raise: Error
		withMessageText: 'The game has finished'
]

{ #category : 'tests' }
GameTest >> test13GameKnowsinwhichLapsAreWe [

	| aGame aShip aCollectionOfShips aChargedDice aCollectionOfDice aSecondShip aLapManager|
	aShip := Ship createWithName: 'juan'.
	aSecondShip := Ship createWithName: 'fran'.
	aChargedDice := ChargedDice withTotalNumberFaces: 6.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: aSecondShip.

	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aChargedDice.
	aLapManager:= Lapmanager CreatWith:aCollectionOfShips.

	aGame := Game
		         createWithName: 'Ludo'
		         andShips: aCollectionOfShips
		         andABordOf: 12
		         andADice: aCollectionOfDice
					andALapManager:aLapManager.

	aGame moves.
	aGame moves.
	aGame moves.

	self assert:  (((aGame whatLapAmI) Lap)=0).
]

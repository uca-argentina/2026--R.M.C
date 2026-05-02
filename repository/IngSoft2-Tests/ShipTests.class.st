Class {
	#name : 'ShipTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTests >> test01AshipisAtostartingposition [

| aShip |
aShip:=Ship creatWith:0.

self assert: (aShip isAt:0).
]

{ #category : 'tests' }
ShipTests >> test02Ashipadvances5steps [

| aShip |
aShip:=Ship creatWith:0.
aShip advancesTo:5.
self assert: (aShip isAt:5).
]

{ #category : 'tests' }
ShipTests >> test03Ashipwhitname [

| aShip |
aShip:=Ship creatWithposition:0 name:'juan'.
aShip advancesTo:5.
self assert: (aShip isAt:5).
]

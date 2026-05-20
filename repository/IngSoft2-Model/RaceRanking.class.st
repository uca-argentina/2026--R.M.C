Class {
	#name : 'RaceRanking',
	#superclass : 'Object',
	#instVars : [
		'rankedStatuses'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
RaceRanking class >> createWithStatus: aSnapshotCollection [
    ^ self new initializeWith: aSnapshotCollection
]

{ #category : 'initialization' }
RaceRanking >> initializeWith: aSnapshotCollection [
    rankedStatuses := aSnapshotCollection
        asSortedCollection: [ :a :b |
            a lap = b lap
                ifTrue:  [ a boardPosition > b boardPosition ]
                ifFalse: [ a lap > b lap ] ]
]

{ #category : 'testing' }
RaceRanking >> isLeader: aShip [
    ^ (self positionOfRank: aShip) = 1
]

{ #category : 'as yet unclassified' }
RaceRanking >> orderedShips [
    ^ rankedStatuses collect: [ :status | status ship name ]
]

{ #category : 'as yet unclassified' }
RaceRanking >> positionOfRank: aShip [
    ^ rankedStatuses
        detectIndex: [ :status | status isFor: aShip ]
]

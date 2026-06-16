Class {
	#name : 'Card',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Card >> applyIn: aCardManager toTarget: aShip [

	^ self subclassResponsibility
]

{ #category : 'testing' }
Card >> isRedo [

	^ false
]

{ #category : 'initialization' }
Card >> throwModifier [

	^ self subclassResponsibility
]

Class {
	#name : 'OverloadTest',
	#superclass : 'CardTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
OverloadTest >> test01CreateCardSobreCarga [
	| aCard |
	aCard := Overload new.
	self assert: (aCard nameIs:'SobreCarga').


]

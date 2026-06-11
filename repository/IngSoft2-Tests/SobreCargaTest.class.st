Class {
	#name : 'SobreCargaTest',
	#superclass : 'CardTest',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
SobreCargaTest >> test01CreateCardSobreCarga [
	| aCard |
	aCard := SobreCarga new.
	self assert: (aCard nameIs:'SobreCarga').


]

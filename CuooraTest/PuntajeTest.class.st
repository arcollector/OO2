Class {
	#name : #PuntajeTest,
	#superclass : #TestCase,
	#instVars : [
		'u'
	],
	#category : #CuooraTest
}

{ #category : #running }
PuntajeTest >> setUp [ 
	u := Usuario crear: 'Test' conPassword: '123456'.
]

{ #category : #tests }
PuntajeTest >> testCrear [
	| t |
	t := Puntaje like: u.
	self assert: (t esLike).
	self assert: t usuario equals: u.
	t := Puntaje dislike: u.
	self assert: (t esDislike).
	self assert: t usuario equals: u.
]

{ #category : #tests }
PuntajeTest >> testLikeness [
	| t |
	t := Puntaje like: u.
	self assert: t esLike.
	self deny: t esDislike.
	t := Puntaje dislike: u.
	self assert: t esDislike.
	self deny: t esLike
]

{ #category : #tests }
PuntajeTest >> testPerteneceA [
	| t |
	t := Puntaje like: u.
	self assert: (t perteneceA: u).
	self deny: (t perteneceA: nil).
]

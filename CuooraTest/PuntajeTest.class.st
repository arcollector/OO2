Class {
	#name : #PuntajeTest,
	#superclass : #TestCase,
	#category : #CuooraTest
}

{ #category : #tests }
PuntajeTest >> testCrear [
	| u t |
	u := Usuario crear: 'Test' conPassword: '123456'.
	t := Puntaje like: u.
	self assert: (t esLike) equals: true.
	t := Puntaje dislike: u.
	self assert: t esDislike equals: true
]

Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'puntajes'
	],
	#category : #Cuoora
}

{ #category : #initialization }
Puntuacion >> agregarPuntaje: aPuntaje [
	| p |
	p := puntajes detect: [ :each | each perteneceA: aPuntaje usuario ] ifNone: [ nil ] .
	p ifNotNil: [ puntajes remove: p ] .
	puntajes add: aPuntaje .

]

{ #category : #initialization }
Puntuacion >> dislikes [
	^ (puntajes select: [ :each | each esDislike ]) size .

]

{ #category : #initialization }
Puntuacion >> initialize [ 
	puntajes := OrderedCollection new .
]

{ #category : #initialization }
Puntuacion >> likes [
	^ (puntajes select: [ :each | each esLike ]) size .

]

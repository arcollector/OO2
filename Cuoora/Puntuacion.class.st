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
	|p|
	p := puntajes reject: [ :each | each perteneceA: aPuntaje usuario ] .
	p add: aPuntaje .
	puntajes := p .

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
	^ (puntajes select: [ :each | each esLike ]) size.

]

Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'puntajes'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Puntuacion class >> crear [ 
	^ self new .
]

{ #category : #initialization }
Puntuacion >> agregarPuntaje: aPuntaje [
	| elem |
	elem := puntajes
		detect: [ :each | each perteneceA: aPuntaje usuario ]
		ifNone: [ nil ].
	elem ifNotNil: [ puntajes remove: elem ].
	puntajes add: aPuntaje
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

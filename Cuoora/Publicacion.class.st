Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'puntajes'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Publicacion >> agregarPuntaje: aPuntaje [
	| elem |
	elem := puntajes
		detect: [ :each | each perteneceA: aPuntaje usuario ]
		ifNone: [ nil ].
	elem ifNotNil: [ puntajes remove: elem ].
	puntajes add: aPuntaje
]

{ #category : #accessing }
Publicacion >> dislike: aUsuario [
	self agregarPuntaje: (Puntaje dislike: aUsuario)
]

{ #category : #accessing }
Publicacion >> dislikes [
	^ (puntajes select: [ :each | each esDislike ]) size .
]

{ #category : #initialization }
Publicacion >> initialize [ 
	puntajes := OrderedCollection new.
]

{ #category : #accessing }
Publicacion >> like: anUsuario [
   self agregarPuntaje: (Puntaje like: anUsuario).
]

{ #category : #accessing }
Publicacion >> likes [
	^ (puntajes select: [ :each | each esLike ]) size.

]

{ #category : #accessing }
Publicacion >> puntaje [
	^ self likes - self dislikes .
]

{ #category : #private }
Publicacion >> puntajes [
	^ puntajes .
]

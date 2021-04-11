Class {
	#name : #Puntaje,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'created_at',
		'tipo'
	],
	#category : #'Cuoora-Model'
}

{ #category : #accessing }
Puntaje class >> dislike: anUsuario [
	^ self new tipo: false ; usuario: anUsuario ; yourself .
]

{ #category : #accessing }
Puntaje class >> like: anUsuario [
	^ self new tipo: true ; usuario: anUsuario ; yourself .
]

{ #category : #'as yet unclassified' }
Puntaje >> esDislike [
	^ tipo not .
]

{ #category : #'as yet unclassified' }
Puntaje >> esLike [
	^ tipo .
]

{ #category : #'as yet unclassified' }
Puntaje >> initialize [ 
	created_at := DateAndTime now .
]

{ #category : #'as yet unclassified' }
Puntaje >> perteneceA: aUsuario [
	^ usuario == aUsuario .
]

{ #category : #'as yet unclassified' }
Puntaje >> tipo: aBool [
	tipo := aBool .
]

{ #category : #'as yet unclassified' }
Puntaje >> usuario [
	^ usuario .
]

{ #category : #'as yet unclassified' }
Puntaje >> usuario: aUsuario [
	usuario := aUsuario .
]

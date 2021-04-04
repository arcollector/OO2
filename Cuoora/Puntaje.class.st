Class {
	#name : #Puntaje,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'created_at',
		'tipo'
	],
	#category : #Cuoora
}

{ #category : #accessing }
Puntaje class >> dislike: anUsuario [
	^ self new tipo: 'DISLIKE' ; usuario: anUsuario ; yourself .
]

{ #category : #accessing }
Puntaje class >> like: anUsuario [
	^ self new tipo: 'LIKE' ; usuario: anUsuario ; yourself .
]

{ #category : #'as yet unclassified' }
Puntaje >> esDislike [
	^ tipo = 'DISLIKE' .
]

{ #category : #'as yet unclassified' }
Puntaje >> esLike [
	^ tipo = 'LIKE' .
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
Puntaje >> tipo: aString [
	tipo := aString .
]

{ #category : #'as yet unclassified' }
Puntaje >> usuario [
	^ usuario .
]

{ #category : #'as yet unclassified' }
Puntaje >> usuario: aUsuario [
	usuario := aUsuario .
]

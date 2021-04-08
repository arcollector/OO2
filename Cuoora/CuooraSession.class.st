Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'Cuoora-UI'
}

{ #category : #initialization }
CuooraSession >> limpiar [
	usuario := nil.
]

{ #category : #initialization }
CuooraSession >> usuario [ 
	^ usuario .
]

{ #category : #initialization }
CuooraSession >> usuario: aUsuario [
	usuario := aUsuario .
]

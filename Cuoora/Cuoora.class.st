Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'preguntas',
		'usuarios'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Cuoora class >> crear [
 ^ self new .
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarPregunta: aPregunta [
	preguntas add: aPregunta .
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarUsuario: aUsuario [
	usuarios add: aUsuario .
]

{ #category : #'as yet unclassified' }
Cuoora >> borrarPregunta: aPregunta [
	preguntas remove: aPregunta ifAbsent: [ ] .
]

{ #category : #initialization }
Cuoora >> initialize [
	preguntas := OrderedCollection new .
	usuarios := OrderedCollection new .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasDeUsuario: aUsuario [
	^ preguntas select: [ :each | each perteneceA: aUsuario ] .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasPorTopico: aTopico [
	^ preguntas select: [ :each | each incluyeTopico: aTopico ] .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasRelevantesDeUsuario: aUsuario [
	| p1 p2 |
	"Se considera relevante
una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o
bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
	p1 := (preguntas
		select: [ :each | each incluyeTopicos: aUsuario topicos ]) asSet.
	p2 := (aUsuario followers
		flatCollect:
			[ :follower | preguntas select: [ :pregunta | pregunta perteneceA: follower ] ])
		asSet.
	p1 addAll: p2.
	^ p1
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPuntajeDeUsuario: aUsuario [
	| p1 p1p p2 p2p t |
	p1 := preguntas select: [ :each | each perteneceA: aUsuario ].
	"solo usamos las respuestas en la que el no hizo la pregunta, osea la de los otros usuarios"
	p2 := (preguntas reject: [ :each | each perteneceA: aUsuario ])
		flatCollect: [ :each | each obtenerRespuestasDeUsuario: aUsuario ].
	p1p := p1 sumNumbers: [ :each | each puntaje ].
	p2p := p2 sumNumbers: [ :each | each puntaje ].
	t := p1 size * 20 + (p2 size * 50) + p1p + p2p.
	^ t
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerRespuestasDeUsuario: aUsuario [
	^ preguntas flatCollect: [ :each | each obtenerRespuestasDeUsuario: aUsuario ].
]

{ #category : #initialization }
Cuoora >> preguntas [
	 ^ preguntas .
]

{ #category : #initialization }
Cuoora >> usuarios [
	^ usuarios .
]

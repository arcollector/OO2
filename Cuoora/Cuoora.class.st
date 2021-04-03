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
Cuoora >> agregarRespuesta: aRespuesta paraLaPregunta: aPregunta [
	aPregunta agregarRespuesta: aRespuesta
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

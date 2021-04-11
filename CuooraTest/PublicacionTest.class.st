Class {
	#name : #PublicacionTest,
	#superclass : #TestCase,
	#instVars : [
		't',
		'u1',
		'u2',
		'p',
		'r'
	],
	#category : #CuooraTest
}

{ #category : #running }
PublicacionTest >> setUp [
	t := Topico crear: 'Topico' conDescripcion: 'Topico'.
	u1 := Usuario crear: 'Usuario 1' conPassword: '123456'.
	u2 := Usuario crear: 'Usuario 2' conPassword: '123456'.
	p := Pregunta
		crear: 'Test pregunta'
		conDescripcion: 'Test pregunta'
		conTopicos: {t}
		conUsuario: u1.
	r := Respuesta crear: 'Test respuesta' conUsuario: u1
]

{ #category : #tests }
PublicacionTest >> testAgregarPuntaje [
	self testAgregarPuntaje: p .
	self testAgregarPuntaje: r .
]

{ #category : #tests }
PublicacionTest >> testAgregarPuntaje: aPreguntaOrRespuesta [
	self assert: aPreguntaOrRespuesta puntajes isEmpty.
	aPreguntaOrRespuesta agregarPuntaje: (Puntaje like: u1).
	self assert: aPreguntaOrRespuesta puntajes size equals: 1.
	aPreguntaOrRespuesta agregarPuntaje: (Puntaje like: u1).
	self assert: aPreguntaOrRespuesta puntajes size equals: 1.
	aPreguntaOrRespuesta agregarPuntaje: (Puntaje dislike: u1).
	self assert: aPreguntaOrRespuesta puntajes size equals: 1.
	aPreguntaOrRespuesta agregarPuntaje: (Puntaje dislike: u2).
	self assert: aPreguntaOrRespuesta puntajes size equals: 2
]

{ #category : #tests }
PublicacionTest >> testDislikes [
	self assert: p dislikes equals: 0.
	p agregarPuntaje: (Puntaje dislike: u1).
	p agregarPuntaje: (Puntaje dislike: u2).
	self assert: p dislikes equals: 2
]

{ #category : #tests }
PublicacionTest >> testLikes [
	self assert: p likes equals: 0.
	p agregarPuntaje: (Puntaje like: u1).
	p agregarPuntaje: (Puntaje like: u2).
	self assert: p likes equals: 2
]

{ #category : #tests }
PublicacionTest >> testPuntaje [
	self testPuntaje: p .
	self testPuntaje: r .
]

{ #category : #tests }
PublicacionTest >> testPuntaje: aPreguntaOrRespuesta [
	self assert: aPreguntaOrRespuesta puntaje equals: 0.
	aPreguntaOrRespuesta like: u1.
	self assert: aPreguntaOrRespuesta puntaje equals: 1.
	aPreguntaOrRespuesta dislike: u2.
	self assert: aPreguntaOrRespuesta puntaje equals: 0.
	aPreguntaOrRespuesta dislike: u1.
	self assert: aPreguntaOrRespuesta puntaje equals: -2.
	aPreguntaOrRespuesta like: u2.
	aPreguntaOrRespuesta like: u1.
	self assert: aPreguntaOrRespuesta puntaje equals: 2
	
]

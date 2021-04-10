Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'pu1',
		'pu2',
		'pu3',
		'ru1',
		'ru2',
		'ru3'
	],
	#category : #CuooraTest
}

{ #category : #running }
CuooraTest >> setUp [ 
	cuoora := Cuoora crear .
]

{ #category : #tests }
CuooraTest >> testAgregarPregunta [
	| p u t1 t2 t3 |
	u := Usuario crear: 'Nickname' conPassword: '123456'.
	t1 := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	t2 := Topico crear: 'Topico 2' conDescripcion: 'Topico 2'.
	t3 := Topico crear: 'Topico 3' conDescripcion: 'Topico 3'.
	p := Pregunta
		crear: 'Test'
		conDescripcion: 'Test'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u.
	self assert: cuoora preguntas size equals: 0.
	cuoora agregarPregunta: p.
	self assert: (cuoora preguntas includes: p) equals: true.
	self assert: cuoora preguntas size equals: 1
]

{ #category : #tests }
CuooraTest >> testAgregarRespuesta [
	| u p r t |
	u := Usuario crear: 'Nickname' conPassword: '123456'.
	t := Topico crear: 'Topico' conDescripcion: 'Topico' .
	p := Pregunta
		crear: 'Question'
		conDescripcion: 'How to ask?'
		conTopicos: { t }
		conUsuario: u.
	r := Respuesta
		crear: 'You need to use Google before to ask!'
		conUsuario: u.
	self assert: (p respuestas) size equals: 0.
	p agregarRespuesta: r .
	cuoora agregarPregunta: p .
	self assert: (p respuestas) size equals: 1.
	self assert: ((p respuestas) includes: r) equals: true
]

{ #category : #tests }
CuooraTest >> testAgregarUsuario [
	| u |
   self assert: (cuoora usuarios size) equals: 0 .
	u := Usuario crear: 'Test' conPassword: '123456' .
	cuoora agregarUsuario: u .
	self assert: (cuoora usuarios size) equals: 1 .
	self assert: (cuoora usuarios includes: u ) equals: true .
	
]

{ #category : #tests }
CuooraTest >> testBorrarPregunta [
	| u t p r |
	u := Usuario crear: 'Test 1' conPassword: '123456'.
	t := Topico crear: 'Topico 1' conDescripcion: 'Topico'.
	p := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos: {t}
		conUsuario: u.
	r := Respuesta crear: 'Answer 1' conUsuario: u.
	cuoora agregarPregunta: p.
   p agregarRespuesta: r .
	cuoora borrarPregunta: p.
	self assert: (cuoora obtenerPreguntasDeUsuario: u) size equals: 0.
	self assert: (cuoora obtenerRespuestasDeUsuario: u) size equals: 0
]

{ #category : #tests }
CuooraTest >> testObtenerPreguntasDeUsuario [
	| u1 u2 u3 p1 p2 p3 t1 t2 t3 |
	u1 := Usuario crear: 'Test' conPassword: '123456'.
	u2 := Usuario crear: 'Prueba' conPassword: '123456'.
	u3 := Usuario crear: 'TestPrueba' conPassword: '123456'.
	t1 := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	t2 := Topico crear: 'Topico 2' conDescripcion: 'Topico 2'.
	t3 := Topico crear: 'Topico 3' conDescripcion: 'Topico 3'.
	p1 := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u1.
	p2 := Pregunta
		crear: 'Question 2'
		conDescripcion: 'Question 2'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u2.
	p3 := Pregunta
		crear: 'Question 3'
		conDescripcion: 'Question 3'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u1.
	cuoora agregarPregunta: p1.
	cuoora agregarPregunta: p2.
	cuoora agregarPregunta: p3.
	pu1 := cuoora obtenerPreguntasDeUsuario: u1.
	self assert: pu1 size equals: 2.
	pu2 := cuoora obtenerPreguntasDeUsuario: u2.
	self assert: pu2 size equals: 1.
	pu3 := cuoora obtenerPreguntasDeUsuario: u3.
	self assert: pu3 size equals: 0
]

{ #category : #tests }
CuooraTest >> testObtenerPreguntasPorTopico [
	| u1 p1 p2 p3 t1 t2 t3 |
	u1 := Usuario crear: 'Test' conPassword: '123456'.
	t1 := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	t2 := Topico crear: 'Topico 2' conDescripcion: 'Topico 2'.
	t3 := Topico crear: 'Topico 3' conDescripcion: 'Topico 3'.
	p1 := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos: {t1}
		conUsuario: u1.
	p2 := Pregunta
		crear: 'Question 2'
		conDescripcion: 'Question 2'
		conTopicos:
			{t1.
			t2}
		conUsuario: u1.
	p3 := Pregunta
		crear: 'Question 3'
		conDescripcion: 'Question 3'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u1.
	cuoora agregarPregunta: p1 .
	cuoora agregarPregunta: p2 .
	cuoora agregarPregunta: p3 .
	self assert: (cuoora obtenerPreguntasPorTopico: t1) size equals: 3.
	self assert: (cuoora obtenerPreguntasPorTopico: t2) size equals: 2.
	self assert: (cuoora obtenerPreguntasPorTopico: t3) size equals: 1
]

{ #category : #'as yet unclassified' }
CuooraTest >> testObtenerPreguntasRelevantesDeUsuario [
	| u1 u2 u3 p1 p2 p3 t1 t2 t3 p |
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t1 := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	t2 := Topico crear: 'Topico 2' conDescripcion: 'Topico 2'.
	t3 := Topico crear: 'Topico 3' conDescripcion: 'Topico 3'.
	p1 := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos:
			{t1}
		conUsuario: u1.
	p2 := Pregunta
		crear: 'Question 2'
		conDescripcion: 'Question 2'
		conTopicos: {t2}
		conUsuario: u2.
	p3 := Pregunta
		crear: 'Question 3'
		conDescripcion: 'Question 3'
		conTopicos: {t3}
		conUsuario: u3.
	cuoora agregarPregunta: p1 .
	cuoora agregarPregunta: p2.
	cuoora agregarPregunta: p3.	
	cuoora agregarUsuario: u1 .
	cuoora agregarUsuario: u2 .
	cuoora agregarUsuario: u3 .
	u1 seguirTopico: t1 .
	u1 seguirUsuario: u3 .
	p := cuoora obtenerPreguntasRelevantesDeUsuario: u1.
	self assert: p size equals: 2 .
	self assert: (p at: 1) equals: p3 .
	self assert: (p at: 2) equals: p1 .
]

{ #category : #tests }
CuooraTest >> testObtenerPuntajeDeUsuario [
	| u1 u2 u3 p1 p2 p3 r1 r2 r3 t |
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t := Topico crear: 'Topico' conDescripcion: 'Topico'.
	p1 := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos: {t}
		conUsuario: u1.
	p2 := Pregunta
		crear: 'Question 2'
		conDescripcion: 'Question 2'
		conTopicos: {t}
		conUsuario: u2.
	p3 := Pregunta
		crear: 'Question 3'
		conDescripcion: 'Question 3'
		conTopicos: {t}
		conUsuario: u3.
	cuoora agregarPregunta: p1.
	cuoora agregarPregunta: p2.
	cuoora agregarPregunta: p3.
	cuoora agregarUsuario: u1.
	cuoora agregarUsuario: u2.
	cuoora agregarUsuario: u3.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u3.
	r2 := Respuesta crear: 'Answer 2' conUsuario: u1.
	r3 := Respuesta crear: 'Answer 3' conUsuario: u1.
	p1 agregarRespuesta: r1.
	p1 agregarRespuesta: r2.
	p2 agregarRespuesta: r3.
	self assert: (cuoora obtenerPuntajeDeUsuario: u1) equals: 20 + 50.
	self assert: (cuoora obtenerPuntajeDeUsuario: u2) equals: 20.
	self assert: (cuoora obtenerPuntajeDeUsuario: u3) equals: 20 + 50.
	p1 like: u1.
	p1 like: u2.
	p1 dislike: u3.
	self assert: (cuoora obtenerPuntajeDeUsuario: u1) equals: 20 + 50 + 1.
	p2 dislike: u1.
	p2 dislike: u3.
	self assert: (cuoora obtenerPuntajeDeUsuario: u2) equals: 18.
	p3 like: u1.
	p3 dislike: u2.
	self assert: (cuoora obtenerPuntajeDeUsuario: u3) equals: 20 + 50
]

{ #category : #tests }
CuooraTest >> testObtenerRespuestasDeUsuario [
	| u1 u2 u3 p r1 r2 r3 t |
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t := Topico crear: 'Topico 1' conDescripcion: 'Topico'.
	p := Pregunta
		crear: 'Question 1'
		conDescripcion: 'Question 1'
		conTopicos: {t}
		conUsuario: u1.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u1.
	r2 := Respuesta crear: 'Answer 2' conUsuario: u1.
	r3 := Respuesta crear: 'Answer 3' conUsuario: u2.
	cuoora agregarPregunta: p .
	p agregarRespuesta: r1.
	p agregarRespuesta: r2.
	p agregarRespuesta: r3.
	ru1 := cuoora obtenerRespuestasDeUsuario: u1.
	self assert: ru1 size equals: 2.
	ru2 := cuoora obtenerRespuestasDeUsuario: u2.
	self assert: ru2 size equals: 1.
	ru3 := cuoora obtenerRespuestasDeUsuario: u3.
	self assert: ru3 size equals: 0
]

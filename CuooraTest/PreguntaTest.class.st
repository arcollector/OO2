Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#category : #CuooraTest
}

{ #category : #tests }
PreguntaTest >> testCrear [
	| p t1 t2 t3 u |
	t1 := Topico crear: 'Chile' conDescripcion: 'Chile'.
	t2 := Topico crear: 'Argentina' conDescripcion: 'Argentina'.
	t3 := Topico crear: 'Mexico' conDescripcion: 'Mexico'.
	u := Usuario crear: 'Test' conPassword: '123456'.
	p := Pregunta
		crear: 'Question'
		conDescripcion: 'How to ask?'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u.
	self assert: p titulo equals: 'Question'.
	self assert: p descripcion equals: 'How to ask?'.
	self assert: (p topicos includes: t1) equals: true.
	self assert: (p topicos includes: t2) equals: true.
	self assert: (p topicos includes: t3) equals: true
]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasOrdenadasPorPuntaje [
	| u1 u2 u3 t p r1 r2 r3 res |
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t}
		conUsuario: u1.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u1.
	r2 := Respuesta crear: 'Answer 2' conUsuario: u1.
	r3 := Respuesta crear: 'Answer 3' conUsuario: u1.
	p agregarRespuesta: r1.
	p agregarRespuesta: r2.
	p agregarRespuesta: r3.
	r1 like: u1.
	r2 like: u1.
	r2 like: u2.
	r3 like: u1.
	r3 like: u2.
	r3 like: u3.
	res := p obtenerRespuestasOrdenadasPorPuntaje.
	self assert: res size equals: 3.
	self assert: (res at: 1) equals: r3.
	self assert: (res at: 2) equals: r2.
	self assert: (res at: 3) equals: r1.
	r3 dislike: u3.
	r3 dislike: u2.
	r3 dislike: u1.
	res := p obtenerRespuestasOrdenadasPorPuntaje.
	self assert: (res at: 1) equals: r2.
	self assert: (res at: 2) equals: r1.
	self assert: (res at: 3) equals: r3
]

{ #category : #tests }
PreguntaTest >> testPuntaje [
	| u1 u2 u3 t p r1 r2 r3 res |
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t}
		conUsuario: u1.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u1.
	p agregarRespuesta: r1.
	r1 like: u1.
	r1 like: u2.
	r1 like: u3.
	self assert: r1 puntaje equals: 3.
	r1 dislike: u1.
	r1 dislike: u2.
	r1 dislike: u3.
	self assert: r1 puntaje equals: -3.
	r1 like: u1.
	r1 dislike: u2 .
	r1 like: u3.
	self assert: r1 puntaje equals: 1 .
	r1 dislike: u1 .
	r1 dislike: u2 .
	r1 like: u3 .
	self assert: r1 puntaje equals: -1.
]

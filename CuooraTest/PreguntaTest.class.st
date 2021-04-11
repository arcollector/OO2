Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'u2',
		'u3',
		't1',
		't2',
		't3'
	],
	#category : #CuooraTest
}

{ #category : #running }
PreguntaTest >> setUp [
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	t1 := Topico crear: 'Chile' conDescripcion: 'Chile'.
	t2 := Topico crear: 'Argentina' conDescripcion: 'Argentina'.
	t3 := Topico crear: 'Mexico' conDescripcion: 'Mexico'.
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	| p r |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
		conUsuario: u1.
	r := Respuesta crear: 'Answer 1' conUsuario: u1.
	self assert: p respuestas isEmpty.
	p agregarRespuesta: r.
	self assert: p respuestas size equals: 1
]

{ #category : #tests }
PreguntaTest >> testAgregarTopicos [
	| p |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
		conUsuario: u1.
	self assert: p topicos size equals: 1.
	p agregarTopicos: {t1}.
	self assert: p topicos size equals: 1.
	p
		agregarTopicos:
			{t2.
			t3}.
	self assert: p topicos size equals: 3
]

{ #category : #tests }
PreguntaTest >> testCompararFechaCreacionCon [
	|oldQuestion newQuestion|
	oldQuestion := Pregunta
		crear: 'Pregunta vieja'
		conDescripcion: 'Test vieja'
		conTopicos: {t1}
		conUsuario: u1.	
	newQuestion := Pregunta
		crear: 'Pregunta nueva'
		conDescripcion: 'Test nueva'
		conTopicos: {t2}
		conUsuario: u2.
	self assert: (newQuestion compararFechaCreacionCon: oldQuestion).
		self deny: (oldQuestion compararFechaCreacionCon: newQuestion).

]

{ #category : #tests }
PreguntaTest >> testCrear [
	| p |
	u1 := Usuario crear: 'Test' conPassword: '123456'.
	p := Pregunta
		crear: 'Question'
		conDescripcion: 'How to ask?'
		conTopicos:
			{t1.
			t2.
			t3}
		conUsuario: u1.
	self assert: p titulo equals: 'Question'.
	self assert: p descripcion equals: 'How to ask?'.
	self assert: (p topicos includes: t1) equals: true.
	self assert: (p topicos includes: t2) equals: true.
	self assert: (p topicos includes: t3) equals: true
]

{ #category : #tests }
PreguntaTest >> testIncluyeTopico [
	| p |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1 . t2 }
		conUsuario: u1.
	self assert: (p incluyeTopico: t1).
	self assert: (p incluyeTopico: t2).
	self deny: (p incluyeTopico: t3).
]

{ #category : #tests }
PreguntaTest >> testIncluyeTopicos [
	| p |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos:
			{t1.
			t2}
		conUsuario: u1.
	self assert: (p incluyeTopicos: {t1}).
	self
		assert:
			(p
				incluyeTopicos:
					{t1.
					t2}).
	self
		assert:
			(p
				incluyeTopicos:
					{t1.
					t2.
					t3}).
	self deny: (p incluyeTopicos: {t3})
]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasDeUsuario [
	| p r1 r2 r3 |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
		conUsuario: u1.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u1.
	r2 := Respuesta crear: 'Answer 2' conUsuario: u2.
	r3 := Respuesta crear: 'Answer 3' conUsuario: u2.
	p agregarRespuesta: r1 .
	p agregarRespuesta: r2 .
	p agregarRespuesta: r3 .
	self assert: (p obtenerRespuestasDeUsuario: u1) size equals: 1.
	self assert: (p obtenerRespuestasDeUsuario: u2) size equals: 2.
	self assert: ((p obtenerRespuestasDeUsuario: u3) isEmpty).
]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasOrdenadasPorPuntaje [
	| p r1 r2 r3 res |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
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
PreguntaTest >> testPerteneceA [
	| p |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
		conUsuario: u1.
	self assert: (p perteneceA: u1).
	self deny: (p perteneceA: u2)
]

{ #category : #tests }
PreguntaTest >> testTotalRespuestas [
	| p r1 r2 r3 |
	p := Pregunta
		crear: 'How to ask'
		conDescripcion: 'How to ask? Please!'
		conTopicos: {t1}
		conUsuario: u1.
	r1 := Respuesta crear: 'Answer 1' conUsuario: u1.
	r2 := Respuesta crear: 'Answer 2' conUsuario: u2.
	r3 := Respuesta crear: 'Answer 3' conUsuario: u2.
	self assert: p totalRespuestas equals: 0.
	p agregarRespuesta: r1.
	p agregarRespuesta: r2.
	p agregarRespuesta: r3.
	self assert: p totalRespuestas equals: 3.
]

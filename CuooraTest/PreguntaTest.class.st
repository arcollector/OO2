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

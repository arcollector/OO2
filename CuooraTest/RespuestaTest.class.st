Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'u',
		'r'
	],
	#category : #CuooraTest
}

{ #category : #tests }
RespuestaTest >> setUp [
	u := Usuario crear: 'Test' conPassword: '123456'.
	r := Respuesta crear: 'Answer text is this' conUsuario: u. 
]

{ #category : #tests }
RespuestaTest >> testCrear [ 
	self assert: r texto equals: 'Answer text is this'.
	self assert: r usuario equals: u.
]

{ #category : #tests }
RespuestaTest >> testPerteneceA [
	self assert: (r perteneceA: u).
	self deny: (r perteneceA: nil).
]

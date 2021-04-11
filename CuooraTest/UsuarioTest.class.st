Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'u2',
		'u3'
	],
	#category : #CuooraTest
}

{ #category : #running }
UsuarioTest >> setUp [ 
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
]

{ #category : #tests }
UsuarioTest >> testCrearUsuario [ 
	| u |
	u := Usuario crear: 'Test' conPassword: '123456' .
	self assert: u nickname equals: 'Test' .
	self assert: u password equals: '123456' .
]

{ #category : #tests }
UsuarioTest >> testDejarUsuario [
	u1 seguirUsuario: u2.
	self assert: u1 followers size equals: 1.
	self should: [ u1 dejarUsuario: u3 ] raise: Error.
	u1 dejarUsuario: u2.
	self assert: u1 followers isEmpty.
]

{ #category : #tests }
UsuarioTest >> testSeguirTopico [
	|t|
	t := Topico crear: 'Topico 1' conDescripcion: 'Topico 1'.
	self assert: u1 topicos isEmpty .
	u1 seguirTopico: t .
	self assert: u1 topicos size equals: 1.
	self assert: (u1 topicos includes: t).
]

{ #category : #tests }
UsuarioTest >> testSeguirUsuario [ 
	u1 seguirUsuario: u2 .
	u1 seguirUsuario: u2 .
	u1 seguirUsuario: u3 .
	self assert: u1 followers size equals: 2.
	self assert: (u1 siguiendoUsuario: u2).
	self assert: (u1 siguiendoUsuario: u3).
	
]

{ #category : #tests }
UsuarioTest >> testSiguiendoUsuario [
	u1 seguirUsuario: u2.
	self assert: (u1 siguiendoUsuario: u2).
	self deny: (u1 siguiendoUsuario: u3)
]

{ #category : #tests }
UsuarioTest >> testTieneConPassword [
	self assert: (u1 tiene: u1 nickname conPassword: u1 password).
	self deny: (u1 tiene: u2 nickname conPassword: u2 password).
	self deny: (u2 tiene: u1 nickname conPassword: u1 password)
]

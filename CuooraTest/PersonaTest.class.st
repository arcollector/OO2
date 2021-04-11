Class {
	#name : #PersonaTest,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'u2',
		'u3'
	],
	#category : #CuooraTest
}

{ #category : #running }
PersonaTest >> setUp [ 
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
]

{ #category : #tests }
PersonaTest >> testCrearUsuario [ 
	| u |
	u := Usuario crear: 'Test' conPassword: '123456' .
	self assert: u nickname equals: 'Test' .
	self assert: u password equals: '123456' .
]

{ #category : #tests }
PersonaTest >> testDejarUsuario [
	u1 seguirUsuario: u2.
	self assert: u1 followers size equals: 1.
	self should: [ u1 dejarUsuario: u3 ] raise: Error.
	u1 dejarUsuario: u2.
	self assert: u1 followers isEmpty.
]

{ #category : #tests }
PersonaTest >> testSeguirUsuario [ 
	u1 := Usuario crear: 'Test 1' conPassword: '123456' .
	u2 := Usuario crear: 'Test 2' conPassword: '123456' .
	u3 := Usuario crear: 'Test 3' conPassword: '123456' .
	u1 seguirUsuario: u2 .
	u1 seguirUsuario: u2 .
	u1 seguirUsuario: u3 .
	self assert: u1 followers size equals: 2.
	self assert: (u1 siguiendoUsuario: u2).
	self assert: (u1 siguiendoUsuario: u3).
	
]

{ #category : #tests }
PersonaTest >> testSiguiendoUsuario [
	u1 := Usuario crear: 'Test 1' conPassword: '123456'.
	u2 := Usuario crear: 'Test 2' conPassword: '123456'.
	u3 := Usuario crear: 'Test 3' conPassword: '123456'.
	u1 seguirUsuario: u2.
	self assert: (u1 siguiendoUsuario: u2).
	self deny: (u1 siguiendoUsuario: u3)
]

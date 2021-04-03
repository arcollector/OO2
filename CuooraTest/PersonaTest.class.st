Class {
	#name : #PersonaTest,
	#superclass : #TestCase,
	#category : #CuooraTest
}

{ #category : #tests }
PersonaTest >> testCrearUsuario [ 
	| u |
	u := Usuario crear: 'Test' conPassword: '123456' .
	self assert: u nickname equals: 'Test' .
	self assert: u password equals: '123456' .
]

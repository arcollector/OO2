Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#category : #CuooraTest
}

{ #category : #tests }
TopicoTest >> testCrear [
	| t |
	t := Topico crear: 'Topico' conDescripcion: 'Topico description'.
	self assert: t nombre equals: 'Topico'.
	self assert: t descripcion equals: 'Topico description'.
]

{ #category : #tests }
TopicoTest >> testPrintString [ 
	|t|
	t := Topico crear: 'Test' conDescripcion: 'Test'.
	self assert: ('[', t printString , ']') equals: '[Test]'.
]

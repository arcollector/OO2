"
| app cuoora |

cuoora := Cuoora soleInstance .
cuoora example1 .

app := WAAdmin register: LoginComponent asApplicationAt: 'cuoora' .
app sessionClass: CuooraSession .


Cuoora clearSoleInstance .
"
Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'preguntas',
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Cuoora class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'as yet unclassified' }
Cuoora class >> crear [
 ^ self new .
]

{ #category : #'as yet unclassified' }
Cuoora class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarPregunta: aPregunta [
	preguntas add: aPregunta .
]

{ #category : #'as yet unclassified' }
Cuoora >> agregarUsuario: aUsuario [
	usuarios add: aUsuario .
]

{ #category : #'as yet unclassified' }
Cuoora >> borrarPregunta: aPregunta [
	preguntas remove: aPregunta ifAbsent: [ ] .
]

{ #category : #'as yet unclassified' }
Cuoora >> buscarUsuario: nickname conPassword: password [ 
	^ usuarios detect: [ :each | each tiene: nickname conPassword: password ] ifNone: [ nil ].
]

{ #category : #initialization }
Cuoora >> example1 [
	| u1 u2 u3 u4 u5 p1 p2 p3 p4 r11 r12 r13 r14 r21 r22 r31 t1 t2 t3 |
	t1 := Topico crear: 'Smalltalk' conDescripcion: 'Smalltak es un lengauge OO creado por Steve Jobs' .
	t2 := Topico crear: 'Test' conDescripcion: 'Practica de software para verificar el correcto funcionamiento de un programa'.
	t3 := Topico crear: 'Seaside' conDescripcion: 'Framework para aplicaciones web'.
	
	u1 := Usuario crear: 'test' conPassword: '123456' .
	u2 := Usuario crear: 'roberto' conPassword: '123456' .
	u3 := Usuario crear: 'romina' conPassword: '123456' .
	u4 := Usuario crear: 'raul' conPassword: '123456' .
	u5 := Usuario crear: 'ramona' conPassword: '123456'.
	
	self agregarUsuario: u1.
	self agregarUsuario: u2.
	self agregarUsuario: u3.
	
	u1 seguirTopico: t1 .
	u1 seguirTopico: t2 .
	u1 seguirUsuario: u3 .
	
	u2 seguirTopico: t3 .
	
	
	p1 := Pregunta crear: 'Para que sirve el metodo setUp en un Test Case?' conDescripcion: 'Nam pretium ex id iaculis sodales. Mauris mollis neque id magna tempor, sit amet cursus nibh facilisis. In hac habitasse platea dictumst. Aenean dolor ex, sollicitudin vel leo non, sollicitudin bibendum tortor.' conTopicos: { t1 . t2 } conUsuario: u2 .
	p2 := Pregunta crear: 'Que diferencia hay entre un Array y una OrderedCollection?' conDescripcion: 'Vivamus varius, est ut mattis efficitur, nisl quam ultrices purus, a rhoncus urna enim ac sapien. Mauris ut sodales lectus. Cras volutpat urna dui, porta lobortis felis lobortis faucibus.' conTopicos: { t1 } conUsuario: u2.
	p3 := Pregunta crear: 'Que significa #MessageNotUnderstood?' conDescripcion: 'Duis sagittis, ligula at placerat finibus, metus justo ultricies libero, ac finibus enim ante sit amet tortor. Suspendisse dapibus iaculis laoreet.' conTopicos: { t1 } conUsuario: u2.
	p4 := Pregunta crear: 'Como uso WASession en Seaside?' conDescripcion: 'Estoy re perdido por ayuda!!!' conTopicos: { t3 } conUsuario: u3.
	
	" usuario 1 sigue ls topicos t1 y t2 y sigue al usario u3 :
		preguntas relevantes son: p1, p2, p3, p4
	"
	
	self agregarPregunta: p1.
	self agregarPregunta: p2.
	self agregarPregunta: p3.
	self agregarPregunta: p4.
	
	p1 like: u1.
	p1 like: u2.
	p1 like: u4.
	p1 like: u5.
	
	p2 like: u1.
	p2 like: u2.
	

	r11 := Respuesta crear: 'Sirve para inicializar las variables de instancias antes que arrancen cada test' conUsuario: u1.
	r12 := Respuesta crear: 'Esta pregunta ya ha sido varias veces responidida por favor utilizar el buscador antes de iniciar una nueva pregunta' conUsuario: u3.
	r13 := Respuesta crear: 'Perdoname @romina no fue mi intencion soy nuevo en esto de hacer tests en mis codigos' conUsuario: u2.
	r14 := Respuesta crear: 'No problem @roberto UwU' conUsuario: u3.
	p1 agregarRespuesta: r11.
	p1 agregarRespuesta: r12.
	p1 agregarRespuesta: r13.
	p1 agregarRespuesta: r14.
	

	r21 := Respuesta crear: 'Array es una lista fija en tamanio, OrderedCollection es una lista dinamica en tamanio' conUsuario: u1.
	r22 := Respuesta crear: 'Por favor usar el buscador, esta pregunta ya ha sido respondida un millon de veces' conUsuario: u3.
	p2 agregarRespuesta: r21.
	p2 agregarRespuesta: r22.
	
	r31 := Respuesta crear: 'Otra vez @roberto? Usa el buscador por favor!' conUsuario: u3.
	p3 agregarRespuesta: r31 .
]

{ #category : #initialization }
Cuoora >> initialize [
	preguntas := OrderedCollection new .
	usuarios := OrderedCollection new .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasDeUsuario: aUsuario [
	^ preguntas select: [ :each | each perteneceA: aUsuario ] .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasPorTopico: aTopico [
	^ preguntas select: [ :each | each incluyeTopico: aTopico ] .
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPreguntasRelevantesDeUsuario: aUsuario [
	| p1 p2 p |
	"Se considera relevante
una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o
bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
	p1 := preguntas
		select: [ :each | each incluyeTopicos: aUsuario topicos ].
	p2 := aUsuario followers
		flatCollect:
			[ :follower | preguntas select: [ :pregunta | pregunta perteneceA: follower ] ].
	p1 addAll: p2.
	p := p1 asSet asOrderedCollection.
	^ p sort: [ :a :b | a compararFechaCreacionCon: b ]
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerPuntajeDeUsuario: aUsuario [
	| p1 p1p p2 p2p t |
	p1 := preguntas select: [ :each | each perteneceA: aUsuario ].
	"solo usamos las respuestas en la que el no hizo la pregunta, osea la de los otros usuarios"
	p2 := (preguntas reject: [ :each | each perteneceA: aUsuario ])
		flatCollect: [ :each | each obtenerRespuestasDeUsuario: aUsuario ].
	p1p := p1 sumNumbers: [ :each | each puntaje ].
	p2p := p2 sumNumbers: [ :each | each puntaje ].
	t := p1 size * 20 + (p2 size * 50) + p1p + p2p.
	^ t
]

{ #category : #'as yet unclassified' }
Cuoora >> obtenerRespuestasDeUsuario: aUsuario [
	^ preguntas flatCollect: [ :each | each obtenerRespuestasDeUsuario: aUsuario ].
]

{ #category : #initialization }
Cuoora >> preguntas [
	 ^ preguntas .
]

{ #category : #initialization }
Cuoora >> usuarios [
	^ usuarios .
]

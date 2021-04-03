Class {
	#name : #Pregunta,
	#superclass : #PreguntaRespuestaPuntuada,
	#instVars : [
		'titulo',
		'descripcion',
		'usuario',
		'respuestas',
		'created_at',
		'topicos'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Pregunta class >> crear: aTitulo conDescripcion: aDescripcion conTopicos: aTopicos conUsuario: aUsuario [
	^ self new
		titulo: aTitulo;
		descripcion: aDescripcion;
		agregarTopicos: aTopicos ;
		usuario: aUsuario;
		yourself
]

{ #category : #'as yet unclassified' }
Pregunta class >> crear: aTitulo conDescripcion: aDescripcion conUsuario: aUsuario [
	^ self new
		titulo: aTitulo;
		descripcion: aDescripcion;
		usuario: aUsuario;
		yourself
]

{ #category : #accessing }
Pregunta >> agregarRespuesta: aRespuesta [
	respuestas add: aRespuesta .
]

{ #category : #accessing }
Pregunta >> agregarTopicos: aCollection [
	topicos addAll: aCollection .
]

{ #category : #accessing }
Pregunta >> descripcion [ 
	^ descripcion .
]

{ #category : #accessing }
Pregunta >> descripcion: aString [
	descripcion := aString .
]

{ #category : #accessing }
Pregunta >> incluyeTopico: aTopico [
	^ topicos includes: aTopico .
]

{ #category : #accessing }
Pregunta >> incluyeTopicos: aTopicos [
	^ topicos includesAny: aTopicos .
]

{ #category : #accessing }
Pregunta >> initialize [
	super initialize .
	respuestas := OrderedCollection new .
	created_at := DateAndTime now .
	topicos := Set new .
	
]

{ #category : #accessing }
Pregunta >> obtenerRespuestasDeUsuario: aUsuario [
	^ respuestas select: [ :each | each perteneceA: aUsuario ] .
]

{ #category : #'as yet unclassified' }
Pregunta >> obtenerRespuestasOrdenadasPorPuntaje [
	^ respuestas sort: [ :a :b | a puntaje > b puntaje ] .
]

{ #category : #accessing }
Pregunta >> perteneceA: aUsuario [
	^ usuario == aUsuario .
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas .
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo .
]

{ #category : #accessing }
Pregunta >> titulo: aString [
	titulo := aString .
]

{ #category : #accessing }
Pregunta >> topicos [
 	 ^ topicos .
]

{ #category : #accessing }
Pregunta >> usuario: aUsuario [
	usuario := aUsuario .
]

Class {
	#name : #Respuesta,
	#superclass : #PreguntaRespuestaPuntuada,
	#instVars : [
		'texto',
		'created_at',
		'pregunta',
		'usuario'
	],
	#category : #Cuoora
}

{ #category : #'as yet unclassified' }
Respuesta class >> crear: aTexto conUsuario: aUsuario [
	^ self new
		texto: aTexto;
		usuario: aUsuario;
		yourself
]

{ #category : #initialization }
Respuesta >> initialize [
	super initialize .
	created_at := DateAndTime now .
	
]

{ #category : #accessing }
Respuesta >> perteneceA: aUsuario [
	^ usuario == aUsuario .
]

{ #category : #accessing }
Respuesta >> pregunta [ 
	^ pregunta .
]

{ #category : #accessing }
Respuesta >> pregunta: aPregunta [
	pregunta := aPregunta .
]

{ #category : #accessing }
Respuesta >> texto [
  ^ texto .
]

{ #category : #accessing }
Respuesta >> texto: aString [
	texto := aString .
]

{ #category : #accessing }
Respuesta >> usuario [ 
	 ^ usuario .
]

{ #category : #accessing }
Respuesta >> usuario: aUsuario [
	 usuario := aUsuario .
]

Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#instVars : [
		'texto',
		'created_at',
		'usuario'
	],
	#category : #'Cuoora-Model'
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

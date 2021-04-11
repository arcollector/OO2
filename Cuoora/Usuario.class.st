Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nickname',
		'password',
		'followers',
		'created_at',
		'topicos'
	],
	#category : #'Cuoora-Model'
}

{ #category : #accessing }
Usuario class >> crear: aNickname conPassword: aPassword [
	^ self new nickname: aNickname ; password: aPassword ; yourself .
]

{ #category : #'as yet unclassified' }
Usuario >> dejarUsuario: aUsuario [
	followers remove: aUsuario
]

{ #category : #'as yet unclassified' }
Usuario >> followers [
	^ followers .
]

{ #category : #initialization }
Usuario >> initialize [ 
	followers := Set new .
	topicos := Set new .
	created_at := DateAndTime now .
]

{ #category : #accessing }
Usuario >> nickname [ 
	^ nickname .
]

{ #category : #accessing }
Usuario >> nickname: aString [
	nickname := aString .
]

{ #category : #accessing }
Usuario >> password [ 
	^ password .
]

{ #category : #accessing }
Usuario >> password: aString [
	password := aString .
]

{ #category : #'as yet unclassified' }
Usuario >> seguirTopico: aTopico [
	topicos add: aTopico .
]

{ #category : #'as yet unclassified' }
Usuario >> seguirUsuario: aUsuario [
	followers add: aUsuario .
]

{ #category : #'as yet unclassified' }
Usuario >> siguiendoUsuario: aUsuario [
	^ followers includes: aUsuario .
]

{ #category : #'as yet unclassified' }
Usuario >> tiene: aNickname conPassword: aPassword [
	^ (nickname = aNickname) and: [ password = aPassword ] .
]

{ #category : #'as yet unclassified' }
Usuario >> topicos [
	^ topicos .
]

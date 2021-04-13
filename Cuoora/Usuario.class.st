Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nickname',
		'password',
		'following',
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
	following remove: aUsuario
]

{ #category : #'as yet unclassified' }
Usuario >> equals: aUsuario [
	^ self == aUsuario .
]

{ #category : #'as yet unclassified' }
Usuario >> following [
	^ following .
]

{ #category : #initialization }
Usuario >> initialize [ 
	following := Set new .
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

{ #category : #'as yet unclassified' }
Usuario >> password [ 
	^ password .
]

{ #category : #'as yet unclassified' }
Usuario >> password: aPassword [
	password := aPassword .
]

{ #category : #'as yet unclassified' }
Usuario >> seguirTopico: aTopico [
	topicos add: aTopico .
]

{ #category : #'as yet unclassified' }
Usuario >> seguirUsuario: aUsuario [
	following add: aUsuario .
]

{ #category : #'as yet unclassified' }
Usuario >> siguiendoUsuario: aUsuario [
	^ following includes: aUsuario .
]

{ #category : #'as yet unclassified' }
Usuario >> tiene: aNickname conPassword: aPassword [
	^ (nickname = aNickname) and: [ password = aPassword ] .
]

{ #category : #'as yet unclassified' }
Usuario >> topicos [
	^ topicos .
]

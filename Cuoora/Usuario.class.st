Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nickname',
		'password'
	],
	#category : #Cuoora
}

{ #category : #accessing }
Usuario class >> crear: aNickname conPassword: aPassword [
	^ self new nickname: aNickname ; password: aPassword ; yourself .
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

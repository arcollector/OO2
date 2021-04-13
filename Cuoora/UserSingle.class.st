Class {
	#name : #UserSingle,
	#superclass : #Question,
	#instVars : [
		'usuario'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
UserSingle class >> crear: aUsuario [
	^ self new usuario: aUsuario ; yourself .
]

{ #category : #rendering }
UserSingle >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderFollowingActions: aCanvas .
	self renderQuestions: aCanvas
]

{ #category : #rendering }
UserSingle >> renderFollowAction: aCanvas [
	aCanvas heading
		level3;
		with: [ aCanvas text: 'Preguntas de ' , usuario nickname.
			aCanvas space.
			aCanvas anchor
				callback: [ 
					self session usuario seguirUsuario: usuario
					];
				with: 'follow' ]
]

{ #category : #rendering }
UserSingle >> renderFollowingActions: aCanvas [
	(self session usuario equals: usuario) ifTrue: [ ^ self ].
	(self session usuario siguiendoUsuario: usuario)
		ifTrue: [ self renderUnfollowAction: aCanvas ]
		ifFalse: [ self renderFollowAction: aCanvas ]
]

{ #category : #rendering }
UserSingle >> renderQuestions: aCanvas [
	| q |
	q := Cuoora soleInstance
		obtenerPreguntasDeUsuario: usuario.
	q isEmpty
		ifTrue: [ aCanvas
				paragraph: 'Este usuario no ha creado preguntas hasta ahora' ]
		ifFalse: [ q do:
				[ :each | self renderQuestion: each withCanvas: aCanvas ] ]
]

{ #category : #rendering }
UserSingle >> renderUnfollowAction: aCanvas [
	aCanvas heading
		level3;
		with: [ aCanvas text: 'Preguntas de ' , usuario nickname.
			aCanvas space.
			aCanvas anchor
				callback: [ 
					self session usuario dejarUsuario: usuario
					];
				with: 'unfollow' ]
]

{ #category : #rendering }
UserSingle >> usuario [ 
	^ usuario .
]

{ #category : #rendering }
UserSingle >> usuario: aUsuario [
	usuario := aUsuario .
]

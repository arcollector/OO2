Class {
	#name : #LatestQuestions,
	#superclass : #Question,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
LatestQuestions >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderNewQuestionButton: aCanvas.
	aCanvas heading: [ aCanvas strong: 'Ultimas preguntas' ].
	aCanvas paragraph class: 'alert' ; with: 'Se muestran preguntas que son relevantes a tu perfil usuario (topicos y usuarios que sigues)'.
	self renderQuestions: aCanvas
]

{ #category : #rendering }
LatestQuestions >> renderNewQuestionButton: aCanvas [
	aCanvas paragraph
		class: 'text-align-right';
		with: [ aCanvas anchor
				callback: [ self call: NewQuestion new ];
				with: '+ Hacer una nueva pregunta' ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestions: aCanvas [
	| q |
	q := Cuoora soleInstance
		obtenerPreguntasRelevantesDeUsuario: self session usuario.
	q isEmpty
		ifTrue: [ aCanvas
				paragraph: 'No se encontraron preguntas relevantes acorde a tu perfil de usuario' ]
		ifFalse: [ q do:
				[ :each | self renderQuestion: each withCanvas: aCanvas ] ]
]

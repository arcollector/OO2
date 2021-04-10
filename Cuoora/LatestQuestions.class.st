Class {
	#name : #LatestQuestions,
	#superclass : #ProtectedPage,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
LatestQuestions >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderNewQuestionButton: aCanvas.
	aCanvas heading: [ aCanvas strong: 'Ultimas preguntas' ].
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
LatestQuestions >> renderQuestion: each withCanvas: aCanvas [
	aCanvas
		table class: 'question' ; with: [ self renderQuestionHeader: each withCanvas: aCanvas.
			self renderQuestionTopics: each withCanvas: aCanvas.
			aCanvas
				tableRow: [ self renderQuestionAuthor: each withCanvas: aCanvas.
					self renderQuestionAnswersCount: each withCanvas: aCanvas ].
			self renderQuestionLikesDisLikesCount: each withCanvas: aCanvas.
			self renderQuestionLikeDislikeButtons: each withCanvas: aCanvas ].
	^ aCanvas horizontalRule
]

{ #category : #hooks }
LatestQuestions >> renderQuestionAnswersCount: each withCanvas: aCanvas [
	^ aCanvas
		tableData:
			[ aCanvas paragraph: each totalRespuestas printString , ' respuestas' ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestionAuthor: each withCanvas: aCanvas [
	aCanvas
		tableData: [ aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					aCanvas anchor
						callback: [  ];
						with: each usuario nickname ] ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestionHeader: each withCanvas: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ 
					aCanvas heading level3 ; with: each titulo
					] ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestionLikeDislikeButtons: each withCanvas: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas
				tableData: [ aCanvas anchor
						callback: [ each like: self session usuario ];
						with: 'like' ].
			aCanvas
				tableData: [ aCanvas anchor
						callback: [ each dislike: self session usuario ];
						with: 'dislike' ] ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestionLikesDisLikesCount: each withCanvas: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas
				tableData: [ aCanvas paragraph: each likes printString , ' likes' ].
			aCanvas
				tableData: [ aCanvas paragraph: each dislikes printString , ' dislikes' ] ]
]

{ #category : #hooks }
LatestQuestions >> renderQuestionTopics: each withCanvas: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas text: 'Topicos: '.
					each topicos
						do: [ :topico | 
							aCanvas span
								class: 'badge';
								with: topico nombre ] ] ]
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

{ #category : #hooks }
LatestQuestions >> style [ 
	^  '
	.question { width: 100% }
	.question h3 { font-style: italic }
	.question .badge { display: inline-block; font-style: italic; margin-right: 3px }
	.question .badge:not(:last-child)::after { content: ", " }
	.question .text-align-right { text-align: right }
	'
]

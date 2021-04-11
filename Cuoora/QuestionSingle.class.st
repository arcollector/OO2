Class {
	#name : #QuestionSingle,
	#superclass : #Question,
	#instVars : [
		'pregunta'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
QuestionSingle class >> crear: aPregunta [
	^ self new pregunta: aPregunta ; yourself .
]

{ #category : #rendering }
QuestionSingle >> pregunta: aPregunta [
	pregunta := aPregunta .
]

{ #category : #rendering }
QuestionSingle >> renderAnswer: each withCanvas: aCanvas [
	aCanvas heading
		level3;
		with: 'Respuesta de ' , each usuario nickname.
	aCanvas paragraph: each texto.
	aCanvas
		table: [ self renderQuestionLikesDisLikesCount: each withCanvas: aCanvas.
			self renderQuestionLikeDislikeButtons: each withCanvas: aCanvas ].
	^ aCanvas horizontalRule
]

{ #category : #rendering }
QuestionSingle >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderQuestion: pregunta withCanvas: aCanvas.
	pregunta respuestas isEmpty
		ifTrue: [ aCanvas paragraph
				class: 'text-italic';
				with: 'Sin respuestas por el momento' ]
		ifFalse: [ pregunta respuestas
				do: [ :each | self renderAnswer: each withCanvas: aCanvas ] ].
	self renderNewAnswerButton: aCanvas
]

{ #category : #rendering }
QuestionSingle >> renderNewAnswerButton: aCanvas [
	aCanvas paragraph
		class: 'text-align-center';
		with: [ aCanvas anchor
				callback: [ self call: (NewAnswer crear: pregunta) ];
				with: '+ Agregar una respuesta' ]
]

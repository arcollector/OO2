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
QuestionSingle >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderQuestion: pregunta withCanvas: aCanvas .
]

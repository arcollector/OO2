Class {
	#name : #NewAnswer,
	#superclass : #Question,
	#instVars : [
		'pregunta',
		'texto',
		'invalidTexto'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
NewAnswer class >> crear: aPregunta [
	^ self new pregunta: aPregunta; yourself .
]

{ #category : #rendering }
NewAnswer >> createAnswer [
	|r|
	r := Respuesta crear: texto value conUsuario: self session usuario .
	pregunta agregarRespuesta: r .
	self answer .
]

{ #category : #rendering }
NewAnswer >> handleSubmit [
	invalidTexto := false.
	texto isEmpty
		ifTrue: [ invalidTexto := true ].
	invalidTexto not
		ifTrue: [ self createAnswer ]
]

{ #category : #rendering }
NewAnswer >> initialize [ 
	super initialize .
	texto := Input new .
	invalidTexto := false .
]

{ #category : #rendering }
NewAnswer >> pregunta [
	 ^ pregunta .
]

{ #category : #rendering }
NewAnswer >> pregunta: aPregunta [
	pregunta := aPregunta .
]

{ #category : #rendering }
NewAnswer >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderQuestion: pregunta withCanvas: aCanvas.
	self renderForm: aCanvas
]

{ #category : #rendering }
NewAnswer >> renderForm: aCanvas [
	aCanvas
		form: [ aCanvas table
				class: 'form';
				with: [ self renderFormTextInput: aCanvas.
					self renderActionsButtons: aCanvas ] ].
			aCanvas horizontalRule .
]

{ #category : #rendering }
NewAnswer >> renderFormTextInput: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas
				tableData: [ aCanvas span
						class: 'text-italic';
						with: 'RESPONDER' ].
			aCanvas
				tableData: [ aCanvas textArea
						value: texto value;
						callback: [ :value | texto value: value ];
						placeholder: 'Escriba aqui el texto de su respuesta' ] ]
]

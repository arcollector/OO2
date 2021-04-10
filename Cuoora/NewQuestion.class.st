Class {
	#name : #NewQuestion,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'invalidTitle',
		'invalidDesription',
		'invalidTopics'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
NewQuestion >> createQuestion [
	| p |
	p := Pregunta
		crear: titulo value
		conDescripcion: descripcion value
		conTopicos: topicos values
		conUsuario: self session usuario.
	Cuoora soleInstance agregarPregunta: p .
	self answer .
]

{ #category : #rendering }
NewQuestion >> handleSubmit [
	invalidTitle := false .
	invalidDesription := false .
	invalidTopics := false.

	titulo isEmpty
		ifTrue: [ invalidTitle := true ].
	descripcion isEmpty
		ifTrue: [ invalidDesription := true ].
	topicos isEmpty
		ifTrue: [ invalidTopics := true ].
		
   (invalidTitle not and: [invalidDesription not and: invalidTopics not]) ifTrue: [  self createQuestion ]
		
]

{ #category : #rendering }
NewQuestion >> initialize [ 
	super initialize .
	titulo := Input new .
	descripcion := Input new .
	topicos := MultiInput new .
	invalidTitle := false .
	invalidDesription := false .
	invalidTopics := false .
]

{ #category : #rendering }
NewQuestion >> renderActionsButtons: aCanvas [
	^ aCanvas
		tableFoot: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas anchor
						callback: [ self answer ];
						with: 'Cancelar'.
					aCanvas space.
					aCanvas submitButton
						callback:
								[ self handleSubmit ];
						with: 'Guardar' ] ]
]

{ #category : #rendering }
NewQuestion >> renderContentOn: aCanvas [
	aCanvas heading: 'Nueva pregunta'.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas
				table: [ self renderTitleInput: aCanvas.
					self renderDescriptionInput: aCanvas.
					self renderTopicsInput: aCanvas.
					self renderActionsButtons: aCanvas ] ]
]

{ #category : #rendering }
NewQuestion >> renderDescriptionInput: aCanvas [
	invalidDesription
		ifTrue: [ self renderErrorMessage: aCanvas ].
	aCanvas
		tableRow: [ aCanvas tableData: 'Desarollo'.
			aCanvas
				tableData: [ aCanvas textArea
						value: descripcion value;
						placeholder: 'Escriba aqui el desarrollo de su pregunta';
						callback: [ :value | descripcion value: value ] ] ]
]

{ #category : #rendering }
NewQuestion >> renderErrorMessage: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas
						paragraph: [ aCanvas strong: 'Este campo no puede estar vacio' ] ] ]
]

{ #category : #rendering }
NewQuestion >> renderTitleInput: aCanvas [

	invalidTitle
		ifTrue: [ self renderErrorMessage: aCanvas ].
	aCanvas
		tableRow: [ aCanvas tableData: 'Titulo'.
			aCanvas
				tableData: [ aCanvas textInput
						value: titulo value;
						placeholder: 'Escriba aqui el titulo de su pregunta';
						callback: [ :value | titulo value: value ] ] ]
]

{ #category : #rendering }
NewQuestion >> renderTopicsInput: aCanvas [
	invalidTopics
		ifTrue: [ self renderErrorMessage: aCanvas ].
	aCanvas
		tableRow: [ aCanvas tableData: 'Topicos'.
			aCanvas
				tableData: [ aCanvas multiSelect
						list: Cuoora soleInstance topicos;
						selected: topicos values;
						callback: [ :values | topicos values: values ] ] ]
]

{ #category : #hooks }
NewQuestion >> style [ 	
	^ '
	table {  width: 60% }
	td input[type="text"], td textarea, td select {  width: 100% }
	td textarea { height: 150px }
	td select {  height: 100px }
	tfoot td { text-align: right }
	strong {  font-style: italic; color: salmon }
	'
]

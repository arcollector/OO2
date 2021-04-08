Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'password',
		'didLoginFail'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
LoginComponent >> doLogin [
	| u |
	u := Cuoora soleInstance
		buscarUsuario: usuario value
		conPassword: password value.
	u
		ifNotNil: [ didLoginFail := false.
			self session usuario: u.
			self call: LatestQuestions new ]
		ifNil: [ didLoginFail := true ]
]

{ #category : #initialization }
LoginComponent >> initialize [ 
	super initialize .
	usuario := Input new .
	password := Input new .
	didLoginFail := false .

]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas
		form: [ aCanvas
				table: [ self renderErrorMessage: aCanvas.
					self renderUsuarioInput: aCanvas.
					self renderPasswordInput: aCanvas.
					self renderSubmitButton: aCanvas ] ]
]

{ #category : #rendering }
LoginComponent >> renderErrorMessage: aCanvas [
	didLoginFail
		ifTrue: [ aCanvas
				tableRow: [ aCanvas tableData
						colSpan: 2;
						with: [ aCanvas paragraph
								with: [ aCanvas strong: 'Usuario y/o contrasena incorrectos' ] ] ] ]
]

{ #category : #rendering }
LoginComponent >> renderPasswordInput: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData: [ aCanvas paragraph: 'Contrasena:' ].
			aCanvas
				tableData: [ aCanvas textInput
						type: 'password';
						value: password value;
						callback: [ :value | password value: value ] ] ]
]

{ #category : #rendering }
LoginComponent >> renderSubmitButton: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas submitButton
						callback: [ self doLogin ];
						with: 'Iniciar sesion' ] ]
]

{ #category : #rendering }
LoginComponent >> renderUsuarioInput: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData: [ aCanvas paragraph: 'Usuario:' ].
			aCanvas
				tableData: [ aCanvas textInput
						value: usuario value;
						callback: [ :value | usuario value: value ] ] ]
]

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
	| cuoora user |
	cuoora := Cuoora crear.
	cuoora agregarUsuario: (Usuario crear: 'test' conPassword: '123456') .
	user := cuoora
		buscarUsuario: usuario value
		conPassword: password value.
	user
		ifNotNil: [ self call: LatestQuestions new ]
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
		form: [ didLoginFail
				ifTrue:
					[ aCanvas paragraph with: 'Usuario y/o contrasena incorrectos' ].
			aCanvas text: 'Usuario: '.
			aCanvas textInput
				value: usuario value;
				callback: [ :value | usuario value: value ].
			aCanvas break.
			aCanvas text: 'Contrasena: '.
			aCanvas textInput
				type: 'password';
				value: password value;
				callback: [ :value | password value: value ].
			aCanvas break.
			aCanvas submitButton
				callback: [ self doLogin ];
				with: 'Iniciar sesion' ]
]

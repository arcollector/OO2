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
	aCanvas div class: 'container' ; with: [ 
	self renderHeader: aCanvas.
	self renderForm: aCanvas
	].
]

{ #category : #rendering }
LoginComponent >> renderErrorMessage: aCanvas [
	didLoginFail
		ifTrue: [ aCanvas
				tableRow: [ aCanvas tableData
						colSpan: 2;
						with: [ aCanvas paragraph class: 'error' ;
								with: [ aCanvas strong: 'Usuario y/o contrasena incorrectos' ] ] ] ]
]

{ #category : #rendering }
LoginComponent >> renderForm: aCanvas [
	aCanvas form
		class: 'form';
		with: [ aCanvas
				fieldSet: [ aCanvas
						table: [ self renderErrorMessage: aCanvas.
							self renderUsuarioInput: aCanvas.
							self renderPasswordInput: aCanvas.
							self renderSubmitButton: aCanvas ] ] ]
]

{ #category : #rendering }
LoginComponent >> renderHeader: aCanvas [
	aCanvas
						heading: [ aCanvas image
								url:
									'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAAyADIDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD6pqKa5ggIE00cZPQOwGfzqWuO8VR+dr9pCWZVkESEqcHBkYf1oA6j+0LP/n6g/wC/i/40f2hZ/wDP1B/38X/GuM1CPw9p95Ja3mrXkc8eNy7C2MgHqEx0Iqv9p8Lf9Bm9/wC/Tf8AxusJYqjF2c1f1RvHC1pK6g7ejO7/ALQs/wDn6g/7+L/jVlSGUFSCDyCK4C8tbEabb3+l3lxPFJN5eX+UcBieMA9QK7HQv+QLYf8AXvH/AOgitk1JXWxi04uz3L1FFFMQVhatpM93rFpdRNGI4mjLBmIPyuW44OevqK3a5jxPr7QyvpeluP7UYDbuHA4zgE8FiOg6fjgHOrVjSjzS/wCH8l5mlKlKrLlj/wAN5vyOU1c3Ooa1f3Vnp9pqMO/GFO5gB8oO1WDdup4qvHqWk2ziPVfDZhcddsjqf++T/jTNLsLXVZtlpO2lazGeImJCOw/un7yt7c+3oN231jXtMuIrDXLD7bDMwiSTA+YngDd0P0PPqRXz8G5v2jdk3vZSXo9FJfM9+aUF7NK7S2u4v1Wri/ka6WMGqeG7P+xYRbweaZVjlJU/xKeRu7muh06BrWwtoHILRRKhI6EgAf0qWGOOGJY4UWONRhVUAAD2Ap9fRQXLFI+em+aTYUUUVRIVzHjjQP7WshcWoxf24yhHVx/d/wAP/r109FZ1qUa0HTnszSjVlRmqkN0ea2drB4wsC+9bbXrYAM/TzQOjN+gJHTjtgV13hE6sdOKa2gEsbbEYn5mA7t2P17/qSPw3bReJDq8TujsDujXhWY5yT+fT15rcrkwuFlTfPP4tnbaXZtdzqxWJjUXJD4d1fePdJ9gooorvOEKKKKACiiigAooooAKKKKACiiigD//Z'.
							aCanvas text: 'Cuoora' ]

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

{ #category : #rendering }
LoginComponent >> style [ 
	^ '
	.container { text-align: center }
	.form {  margin: 0 auto; width: 50% }
	.form table { width: 100% }
	.form .error { color: salmon; font-style: italic }
	'
]

Class {
	#name : #ProtectedPage,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
ProtectedPage >> renderHeader: aCanvas [
	aCanvas table
		style: 'width: 100%';
		with: [ aCanvas
				tableRow: [ aCanvas tableData
						style: 'width: 80%';
						with: [ aCanvas
								heading: [ aCanvas anchor
										callback: [ self call: LatestQuestions new ];
										with: 'Cuoora' ] ].
					aCanvas tableData: [ self renderLogoutNavigation: aCanvas ] ] ].
	aCanvas horizontalRule
]

{ #category : #rendering }
ProtectedPage >> renderLogoutNavigation: aCanvas [
	aCanvas
		table style: 'width: 100%' ; with: [ aCanvas
				tableRow: [ aCanvas
						tableData:
							[ aCanvas paragraph: [ aCanvas strong: self session usuario nickname ] ].
					aCanvas
						tableData: [ aCanvas anchor
								callback: [ self session limpiar.
									self call: LoginComponent new ];
								with: 'Log out' ] ] ]
]

{ #category : #hooks }
ProtectedPage >> style [ 
	^  '
	.text-align-center { text-align: center }
	.text-align-right { text-align: right }
	.text-italic { font-style: italic }
	.badge { display: inline-block; font-style: italic; margin-right: 3px }
	.badge:not(:last-child)::after { content: ", " }
	
	.form {  width: 60% }
	.form td input[type="text"], .form td textarea, .form td select {  width: 100% }
	.form td textarea { height: 150px }
	.form td select {  height: 100px }
	.form tfoot td { text-align: right }
	.form strong {  font-style: italic; color: salmon }
	
	'
]

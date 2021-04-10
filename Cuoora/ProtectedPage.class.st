Class {
	#name : #ProtectedPage,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
ProtectedPage >> renderHeader: aCanvas [
	aCanvas
		table style: 'width: 100%' ; with: [ aCanvas
				tableRow: [ aCanvas tableData
						style: 'width: 80%';
						with: [ aCanvas heading: 'Cuoora' ].
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
									self answer ];
								with: 'Log out' ] ] ]
]

{ #category : #hooks }
ProtectedPage >> style [ 
	^  '
	.text-align-right { text-align: right }
	.badge { display: inline-block; font-style: italic; margin-right: 3px }
	.badge:not(:last-child)::after { content: ", " }
	'
]

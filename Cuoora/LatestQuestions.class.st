Class {
	#name : #LatestQuestions,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
LatestQuestions >> renderContentOn: aCanvas [
	aCanvas table:
		[ self renderHeader: aCanvas ].
	aCanvas horizontalRule
]

{ #category : #rendering }
LatestQuestions >> renderHeader: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas tableData
				class: 'heading';
				with: [ aCanvas heading: 'Cuoora' ].
			aCanvas tableData:
				[ self renderLogoutNavigation: aCanvas ] ]
]

{ #category : #rendering }
LatestQuestions >> renderLogoutNavigation: aCanvas [
	^ aCanvas
		table: [ aCanvas
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
LatestQuestions >> style [ 
	^  '
	table { width: 100% }
	.heading {  width: 80% }
	'
]

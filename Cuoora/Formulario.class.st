Class {
	#name : #Formulario,
	#superclass : #ProtectedPage,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
Formulario >> renderActionsButtons: aCanvas [
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
Formulario >> renderErrorMessage: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas
						paragraph: [ aCanvas strong: 'Este campo no puede estar vacio' ] ] ]
]

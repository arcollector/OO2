Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Topico class >> crear: aNombre conDescripcion: aDescripcion [ 
	^ self new nombre: aNombre ; descripcion: aDescripcion ; yourself .
]

{ #category : #accessing }
Topico >> descripcion [ 
 	^ descripcion .
]

{ #category : #accessing }
Topico >> descripcion: aString [
	descripcion := aString .
]

{ #category : #accessing }
Topico >> nombre [ 
	^ nombre .
]

{ #category : #accessing }
Topico >> nombre: aString [
	nombre := aString .
]

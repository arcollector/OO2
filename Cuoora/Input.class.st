Class {
	#name : #Input,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Cuoora-UI'
}

{ #category : #evaluating }
Input >> isEmpty [
	^ value isEmpty 
]

{ #category : #evaluating }
Input >> value [
	^ value
]

{ #category : #evaluating }
Input >> value: aValue [
	value := aValue .
]

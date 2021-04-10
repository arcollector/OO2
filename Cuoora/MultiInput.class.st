Class {
	#name : #MultiInput,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'Cuoora-UI'
}

{ #category : #initialization }
MultiInput >> initialize [ 
	values := OrderedCollection new.
]

{ #category : #accessing }
MultiInput >> isEmpty [ 
	^ values isEmpty .
]

{ #category : #accessing }
MultiInput >> values [
	^ values .
]

{ #category : #accessing }
MultiInput >> values: aCollection [
	values addAll: aCollection .
]

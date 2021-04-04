Class {
	#name : #PreguntaRespuestaPuntuada,
	#superclass : #Object,
	#instVars : [
		'puntuacion'
	],
	#category : #Cuoora
}

{ #category : #accessing }
PreguntaRespuestaPuntuada >> dislike: aUsuario [
	puntuacion agregarPuntaje: (Puntaje dislike: aUsuario)
]

{ #category : #accessing }
PreguntaRespuestaPuntuada >> dislikes [
	^ puntuacion dislikes .
]

{ #category : #initialization }
PreguntaRespuestaPuntuada >> initialize [ 
	puntuacion := Puntuacion new .
]

{ #category : #accessing }
PreguntaRespuestaPuntuada >> like: anUsuario [
   puntuacion agregarPuntaje: (Puntaje like: anUsuario).
]

{ #category : #accessing }
PreguntaRespuestaPuntuada >> likes [
	^ puntuacion likes .
]

{ #category : #accessing }
PreguntaRespuestaPuntuada >> puntaje [
	^ self likes - self dislikes .
]

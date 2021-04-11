Class {
	#name : #Question,
	#superclass : #Formulario,
	#category : #'Cuoora-UI'
}

{ #category : #hooks }
Question >> renderQuestion: each withCanvas: aCanvas [
	aCanvas
		table style: 'width: 100%' ; with: [ self renderQuestionHeader: each withCanvas: aCanvas.
			self renderQuestionTopics: each withCanvas: aCanvas.
			aCanvas
				tableRow: [ self renderQuestionAuthor: each withCanvas: aCanvas.
					self renderQuestionAnswersCount: each withCanvas: aCanvas ].
			self renderQuestionLikesDisLikesCount: each withCanvas: aCanvas.
			self renderQuestionLikeDislikeButtons: each withCanvas: aCanvas ].
	^ aCanvas horizontalRule
]

{ #category : #hooks }
Question >> renderQuestionAnswersCount: each withCanvas: aCanvas [
	^ aCanvas
		tableData:
			[ aCanvas paragraph: each totalRespuestas printString , ' respuestas' ]
]

{ #category : #hooks }
Question >> renderQuestionAuthor: each withCanvas: aCanvas [
	aCanvas
		tableData: [ aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					aCanvas anchor
						callback: [  ];
						with: each usuario nickname ] ]
]

{ #category : #hooks }
Question >> renderQuestionHeader: each withCanvas: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas heading
						level3;
						style: 'font-style: italic';
						with: [ aCanvas anchor
								callback: [ self call: (QuestionSingle crear: each) ];
								with: each titulo ] ] ]
]

{ #category : #hooks }
Question >> renderQuestionLikeDislikeButtons: each withCanvas: aCanvas [
	^ aCanvas
		tableRow: [ aCanvas
				tableData: [ aCanvas anchor
						callback: [ each like: self session usuario ];
						with: 'like' ].
			aCanvas
				tableData: [ aCanvas anchor
						callback: [ each dislike: self session usuario ];
						with: 'dislike' ] ]
]

{ #category : #hooks }
Question >> renderQuestionLikesDisLikesCount: each withCanvas: aCanvas [
	aCanvas
		tableRow: [ aCanvas
				tableData: [ aCanvas paragraph: each likes printString , ' likes' ].
			aCanvas
				tableData: [ aCanvas paragraph: each dislikes printString , ' dislikes' ] ]
]

{ #category : #hooks }
Question >> renderQuestionTopics: each withCanvas: aCanvas [
	aCanvas
		tableRow: [ aCanvas tableData
				colSpan: 2;
				with: [ aCanvas text: 'Topicos: '.
					each topicos
						do: [ :topico | 
							aCanvas span
								class: 'badge';
								with: topico nombre ] ] ]
]

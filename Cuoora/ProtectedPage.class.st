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
				tableRow: [ self renderHeaderTitle: aCanvas.
						self renderLogoutNavigation: aCanvas ] ].
	aCanvas horizontalRule .
]

{ #category : #rendering }
ProtectedPage >> renderHeaderTitle: aCanvas [
	aCanvas tableData
		class: 'logo';
		style: 'width: 80%';
		with: [ aCanvas anchor
				callback: [ self call: LatestQuestions new ];
				with: [ aCanvas
						heading: [ aCanvas image
								url:
									'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAAyADIDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD6pqKa5ggIE00cZPQOwGfzqWuO8VR+dr9pCWZVkESEqcHBkYf1oA6j+0LP/n6g/wC/i/40f2hZ/wDP1B/38X/GuM1CPw9p95Ja3mrXkc8eNy7C2MgHqEx0Iqv9p8Lf9Bm9/wC/Tf8AxusJYqjF2c1f1RvHC1pK6g7ejO7/ALQs/wDn6g/7+L/jVlSGUFSCDyCK4C8tbEabb3+l3lxPFJN5eX+UcBieMA9QK7HQv+QLYf8AXvH/AOgitk1JXWxi04uz3L1FFFMQVhatpM93rFpdRNGI4mjLBmIPyuW44OevqK3a5jxPr7QyvpeluP7UYDbuHA4zgE8FiOg6fjgHOrVjSjzS/wCH8l5mlKlKrLlj/wAN5vyOU1c3Ooa1f3Vnp9pqMO/GFO5gB8oO1WDdup4qvHqWk2ziPVfDZhcddsjqf++T/jTNLsLXVZtlpO2lazGeImJCOw/un7yt7c+3oN231jXtMuIrDXLD7bDMwiSTA+YngDd0P0PPqRXz8G5v2jdk3vZSXo9FJfM9+aUF7NK7S2u4v1Wri/ka6WMGqeG7P+xYRbweaZVjlJU/xKeRu7muh06BrWwtoHILRRKhI6EgAf0qWGOOGJY4UWONRhVUAAD2Ap9fRQXLFI+em+aTYUUUVRIVzHjjQP7WshcWoxf24yhHVx/d/wAP/r109FZ1qUa0HTnszSjVlRmqkN0ea2drB4wsC+9bbXrYAM/TzQOjN+gJHTjtgV13hE6sdOKa2gEsbbEYn5mA7t2P17/qSPw3bReJDq8TujsDujXhWY5yT+fT15rcrkwuFlTfPP4tnbaXZtdzqxWJjUXJD4d1fePdJ9gooorvOEKKKKACiiigAooooAKKKKACiiigD//Z'.
							aCanvas text: 'Cuoora' ] ] ]
]

{ #category : #rendering }
ProtectedPage >> renderLogoutNavigation: aCanvas [
	aCanvas
		tableData: [ aCanvas table
				style: 'width: 100%';
				with: [ aCanvas
						tableRow: [ aCanvas
								tableData: [ aCanvas anchor
										callback: [ self call: (UserSingle crear: self session usuario) ];
										with: [ aCanvas strong: self session usuario nickname ] ].
							aCanvas
								tableData: [ aCanvas anchor
										callback: [ self session limpiar.
											self call: LoginComponent new ];
										with: 'Log out' ] ] ] ]
]

{ #category : #hooks }
ProtectedPage >> style [ 
	^  '
	.text-align-center { text-align: center }
	.text-align-right { text-align: right }
	.text-italic { font-style: italic }
	.badge { display: inline-block; font-style: italic; margin-right: 3px }
	.badge:not(:last-child)::after { content: ", " }
	
	.logo * { vertical-align: top }
	.logo a { text-decoration: none }
	
	.form {  width: 60% }
	.form td input[type="text"], .form td textarea, .form td select {  width: 100% }
	.form td textarea { height: 150px }
	.form td select {  height: 100px }
	.form tfoot td { text-align: right }
	.form strong {  font-style: italic; color: salmon }
	
	.alert { background: khaki; padding: 3px }
	'
]

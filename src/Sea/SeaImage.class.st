Class {
	#name : #SeaImage,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'imageFile',
		'changesFile',
		'tags'
	],
	#category : #'Sea-Core'
}

{ #category : #accessing }
SeaImage >> directory [
	self shouldBeImplemented.
]

{ #category : #accessing }
SeaImage >> name: anUndefinedObject [ 
	name := anUndefinedObject
]

{ #category : #accessing }
SeaImage >> version: anInteger [ 
	version := anInteger
]

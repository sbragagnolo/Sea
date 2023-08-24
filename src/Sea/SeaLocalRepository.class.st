Class {
	#name : #SeaLocalRepository,
	#superclass : #Object,
	#instVars : [
		'directory'
	],
	#category : #'Sea-Repository'
}

{ #category : #accessing }
SeaLocalRepository class >> rootDirectory [

	^ (FileLocator localDirectory / #sea) asFileReference
		  ensureCreateDirectory;
		  yourself
]

{ #category : #accessing }
SeaLocalRepository >> directory [

	^ directory
]

{ #category : #accessing }
SeaLocalRepository >> initialize [

	super initialize.
	directory := self class rootDirectory
]

{ #category : #accessing }
SeaLocalRepository >> repositoryFor: aString [

	^ SeaLocalRepository new
		  directory: self directory / aString;
		  yourself
]

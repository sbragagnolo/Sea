"
I am in charge of deploying zip files into a local repository.
"
Class {
	#name : #SeaDeployer,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'Sea-Core'
}

{ #category : #deploy }
SeaDeployer >> deployZip: aFileReference name: aString [

	| repo newImage |
	repo := repository repositoryFor: aString.
	newImage := repo newImage.

	self assert: newImage directory exists not.

	newImage directory ensureCreateDirectory.
	
	LibC system: ('unzip {1} -d {2}' format: {
				 aFileReference asFileReference fullName.
				 newImage directory asFileReference fullName }).
	self assert: newImage directory exists.
	self assert: (newImage directory / 'pharo.version') exists.
	^ newImage
]

{ #category : #deploy }
SeaDeployer >> eraseRepository [

	^ repository eraseRepository
]

{ #category : #deploy }
SeaDeployer >> initialize [

	super initialize.
	repository := SeaLocalRepository new
]

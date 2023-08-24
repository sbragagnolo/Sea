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

	GZipReadStream unzip: aFileReference to: newImage directory.
	^ newImage
]

{ #category : #deploy }
SeaDeployer >> initialize [

	super initialize.
	repository := SeaLocalRepository new
]

Class {
	#name : #SeaLocalRepository,
	#superclass : #Object,
	#instVars : [
		'directory',
		'name'
	],
	#category : #'Sea-Repository'
}

{ #category : #accessing }
SeaLocalRepository class >> rootDirectory [

	^ (FileLocator localDirectory / #sea) asFileReference
		  ensureCreateDirectory;
		  yourself
]

{ #category : #'instance creation' }
SeaLocalRepository >> currentMaxVersion [

	^ ({ 0 } , (self directory directories
		    select: [ :dir |
			    (dir basename copyReplaceAll: 'version' with: '') isAllDigits ]
		    thenCollect: [ :dir |
		    (dir basename copyReplaceAll: 'version' with: '') asNumber ]))
		  max + 1
]

{ #category : #accessing }
SeaLocalRepository >> directory [
	^ directory ensureCreateDirectory
]

{ #category : #accessing }
SeaLocalRepository >> directory: aFileReference [ 
	directory := aFileReference
]

{ #category : #accessing }
SeaLocalRepository >> initialize [

	super initialize.
	directory := self class rootDirectory
]

{ #category : #accessing }
SeaLocalRepository >> name [

	^ name
]

{ #category : #accessing }
SeaLocalRepository >> name: aName [

	name := aName
]

{ #category : #'instance creation' }
SeaLocalRepository >> newImage [

	| version |
	version := self currentMaxVersion.

	^ SeaImage new
		  name: self name;
		  version: version;
		  directory:
			  self directory / ('Version{1}' format: { version asString });
		  yourself
]

{ #category : #accessing }
SeaLocalRepository >> repositoryFor: aString [

	^ SeaLocalRepository new
		  directory: self directory / aString;
		  name: aString;
		  yourself
]

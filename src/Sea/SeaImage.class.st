"
I represent an image. 
"
Class {
	#name : #SeaImage,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'imageFile',
		'changesFile',
		'tags',
		'directory',
		'repository',
		'sourcesFile'
	],
	#category : #'Sea-Core'
}

{ #category : #accessing }
SeaImage >> changesFile [

	^ changesFile ifNil: [ changesFile := self inferChangesFile ]
]

{ #category : #accessing }
SeaImage >> directory [

	^ directory
]

{ #category : #accessing }
SeaImage >> directory: aFileReference [

	directory := aFileReference
]

{ #category : #accessing }
SeaImage >> ensureSingleEntry: aCollection [

	self assert: aCollection size = 1.
	^ aCollection first
]

{ #category : #accessing }
SeaImage >> imageFile [

	^ imageFile ifNil: [ imageFile := self inferImageFile ]
]

{ #category : #accessing }
SeaImage >> inferChangesFile [

	^ self ensureSingleEntry:
		  (directory entries select: [ :d | d extension = 'changes' ])
]

{ #category : #accessing }
SeaImage >> inferImageFile [

	^ self ensureSingleEntry:
		  (directory entries select: [ :d | d extension = 'image' ])
]

{ #category : #accessing }
SeaImage >> inferSourcesFile [

	^ self ensureSingleEntry:
		  (directory entries select: [ :d | d extension = 'sources' ])
]

{ #category : #accessing }
SeaImage >> missingFiles [

	^ {
		  self directory.
		  (self directory / 'pharo.version').
		  self imageFile.
		  self changesFile.
		  self sourcesFile } reject: [ :f | f exists ]
]

{ #category : #accessing }
SeaImage >> name [
	^ name
]

{ #category : #accessing }
SeaImage >> name: anUndefinedObject [ 
	name := anUndefinedObject
]

{ #category : #accessing }
SeaImage >> newInstance [

	^ SeaRunningInstance new
		  image: self;
		  pid: self spawnInstance;
		  yourself
]

{ #category : #'as yet unclassified' }
SeaImage >> pharoVersion [

	^ self pharoVersionFile readStream upToEnd asNumber
]

{ #category : #'as yet unclassified' }
SeaImage >> pharoVersionFile [

	^ (self directory / 'pharo.version') 
]

{ #category : #accessing }
SeaImage >> repository: aSeaImageRepository [

	repository := aSeaImageRepository
]

{ #category : #accessing }
SeaImage >> sourcesFile [

	^ sourcesFile ifNil: [ sourcesFile := self inferSourcesFile ]
]

{ #category : #accessing }
SeaImage >> version [
	^ version
]

{ #category : #accessing }
SeaImage >> version: anInteger [ 
	version := anInteger
]

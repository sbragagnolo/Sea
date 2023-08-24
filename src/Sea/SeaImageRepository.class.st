Class {
	#name : #SeaImageRepository,
	#superclass : #SeaLocalRepository,
	#instVars : [
		'parent'
	],
	#category : #'Sea-Repository'
}

{ #category : #'instance creation' }
SeaImageRepository >> currentMaxVersion [
	^ ({ 0 } , (self directory directories
		    select: [ :dir |
			    (dir basename copyReplaceAll: 'Version' with: '') isAllDigits ]
		    thenCollect: [ :dir |
		    (dir basename copyReplaceAll: 'Version' with: '') asNumber ]))
		  max + 1
]

{ #category : #'instance creation' }
SeaImageRepository >> imagesRepository [

	^ self
]

{ #category : #'instance creation' }
SeaImageRepository >> newImage [
	| version |
	version := self currentMaxVersion.

	^ SeaImage new
		  name: self name;
		  version: version;
		  repository: self;
		  directory:
			  self directory / ('Version{1}' format: { version asString });
		  yourself
]

{ #category : #accessing }
SeaImageRepository >> parent: aSeaLocalRepository [ 
	parent := aSeaLocalRepository
]

{ #category : #'instance creation' }
SeaImageRepository >> virtualMachinesRepository [

	^ parent virtualMachinesRepository
]

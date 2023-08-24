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

{ #category : #accessing }
SeaLocalRepository >> directory [
	^ directory ensureCreateDirectory
]

{ #category : #accessing }
SeaLocalRepository >> directory: aFileReference [ 
	directory := aFileReference
]

{ #category : #accessing }
SeaLocalRepository >> eraseRepository [
	directory ensureDeleteAll
]

{ #category : #'instance creation' }
SeaLocalRepository >> imagesRepository [
	^ SeaImageRepository new
		  directory: self directory / #images;
		  parent: self;
		  yourself
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

{ #category : #accessing }
SeaLocalRepository >> repositoryFor: aString [

	^ self class new
		  directory: self directory / aString;
		  name: aString;
		  parent: self;
		  yourself
]

{ #category : #'instance creation' }
SeaLocalRepository >> virtualMachinesRepository [
	^ SeaVirtualMachineRepository new
		  directory: self directory / #virtualMachines;
		  yourself
]

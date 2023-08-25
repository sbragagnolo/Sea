"
I am in charge of deploying zip files into a local repository.
"
Class {
	#name : #SeaDeployer,
	#superclass : #SeaService,
	#category : #'Sea-Core'
}

{ #category : #deploy }
SeaDeployer >> deployImageZip: aFileReference name: aString [

	| repo newImage |
	repo := imagesRepository repositoryFor: aString.
	newImage := repo newImage.
	newImage directory exists ifTrue: [
		^ self error:
			  'The image directory already exists. Delete it to proceed' ].
	newImage directory ensureCreateDirectory.
	self unzip: newImage into: aFileReference.
	self ensureNoMissingFiles: newImage.

	^ newImage
]

{ #category : #deploy }
SeaDeployer >> deployVmZip: aFileReference version: aVersion [

	| repo newVirtualMachine osname |
	repo := virtualMachineRepository repositoryFor: aVersion asString.
	newVirtualMachine := repo newVirtualMachine: aVersion.

	self assert: newVirtualMachine directory exists not.

	newVirtualMachine directory ensureCreateDirectory.
	self unzip: newVirtualMachine into: aFileReference.
	self ensureNoMissingFiles: newVirtualMachine.

	osname := newVirtualMachine osname.

	(repo directory / osname) exists ifTrue: [
		newVirtualMachine directory deleteAll.
		^ self error: 'Already exists' ].
	newVirtualMachine directory renameTo: osname.


	^ newVirtualMachine
]

{ #category : #deploy }
SeaDeployer >> ensureNoMissingFiles: anEntity [

	anEntity missingFiles ifNotEmpty: [ :files |
		self error:
			('Cannot continue deploying. The following files are missing {1}'
				 format:
				 { (String crlf join: (files collect: [ :f | f basename ])) }) ]
]

{ #category : #deploy }
SeaDeployer >> eraseRepository [

	imagesRepository eraseRepository.
	virtualMachineRepository eraseRepository
]

{ #category : #deploy }
SeaDeployer >> resolveVirtualMachine: aVersionNumber [
	virtualMachineRepository virtualMachinesVersion: aVersionNumber ifNone: [ 
		
	
	 ]
]

{ #category : #deploy }
SeaDeployer >> unzip: newVirtualMachine into: aFileReference [

	LibC system: ('unzip {1} -d {2}' format: {
				 aFileReference asFileReference fullName.
				 newVirtualMachine directory asFileReference fullName })
]

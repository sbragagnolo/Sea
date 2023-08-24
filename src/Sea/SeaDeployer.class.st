"
I am in charge of deploying zip files into a local repository.
"
Class {
	#name : #SeaDeployer,
	#superclass : #Object,
	#instVars : [
		'imagesRepository',
		'virtualMachineRepository'
	],
	#category : #'Sea-Core'
}

{ #category : #deploy }
SeaDeployer >> deployImageZip: aFileReference name: aString [

	| repo newImage |
	repo := imagesRepository repositoryFor: aString.
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
SeaDeployer >> deployVmZip: aFileReference version: aVersion [

	| repo newVirtualMachine |
	repo := virtualMachineRepository repositoryFor: aVersion.
	newVirtualMachine := repo newVirtualMachine.

	self assert: newVirtualMachine directory exists not.

	newVirtualMachine directory ensureCreateDirectory.

	LibC system: ('unzip {1} -d {2}' format: {
				 aFileReference asFileReference fullName.
				 newVirtualMachine directory asFileReference fullName }).
	self assert: newVirtualMachine directory exists.
	self assert: (newVirtualMachine directory / 'pharo.version') exists.
	self assert: (newVirtualMachine directory / 'os.name') exists.
	^ newVirtualMachine
]

{ #category : #deploy }
SeaDeployer >> eraseRepository [

	imagesRepository eraseRepository.
	virtualMachineRepository eraseRepository
]

{ #category : #deploy }
SeaDeployer >> initialize [

	super initialize.
	imagesRepository := SeaLocalRepository new imagesRepository.
	virtualMachineRepository := SeaLocalRepository new
		                            virtualMachinesRepository
]

{ #category : #deploy }
SeaDeployer >> resolveVirtualMachine: aVersionNumber [
	virtualMachineRepository virtualMachinesVersion: aVersionNumber ifNone: [ 
		
	
	 ]
]

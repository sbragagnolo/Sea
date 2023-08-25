Class {
	#name : #SeaStarter,
	#superclass : #SeaService,
	#category : #'Sea-Core'
}

{ #category : #'as yet unclassified' }
SeaStarter >> startInstance: aString [

	^ self startInstance: aString version: #Version1
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstance: anImageName version: aVersionString [

	^ self startInstanceImage:
		  ((imagesRepository repositoryFor: anImageName) imageVersion:
			   aVersionString)
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstanceImage: aSeaImage [

	^ self
		  startInstanceImage: aSeaImage
		  virtualMachine: (virtualMachineRepository
				   virtualMachine: aSeaImage pharoVersion
				   osname: OSPlatform current name)
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstanceImage: aSeaImage virtualMachine: aSeaVirtualMachine [

	| instance process |
	process := OSSUnixSubprocess new.
	process workingDirectory: aSeaImage directory fullName.

	process loginShellCommand: ('"{1}" "{2}"' format: {
				 aSeaVirtualMachine vmBinary fullName.
				 aSeaImage imageFile fullName }).
	process run.
	instance := SeaRunningInstance new
		            image: aSeaImage;
		            virtualMachine: aSeaVirtualMachine;
		            process: process;
		            yourself.

	^ instance
]

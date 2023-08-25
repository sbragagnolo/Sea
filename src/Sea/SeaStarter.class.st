Class {
	#name : #SeaStarter,
	#superclass : #Object,
	#category : #'Sea-Core'
}

{ #category : #'as yet unclassified' }
SeaStarter >> imageRepository [

	^ SeaLocalRepository new imagesRepository
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstance: aString [

	^ self startInstance: aString version: #Version1
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstance: anImageName version: aVersionString [

	^ self startInstanceImage:
		  ((self imageRepository repositoryFor: anImageName) imageVersion:
			   aVersionString)
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstanceImage: aSeaImage [

	self
		startInstanceImage: aSeaImage
		virtualMachine: (self virtualMachineRepository
				 virtualMachine: aSeaImage pharoVersion
				 osname: OSPlatform current name)
]

{ #category : #'as yet unclassified' }
SeaStarter >> startInstanceImage: aSeaImage virtualMachine: aSeaVirtualMachine [

	LibC runCommand: ('{1} {2} & ' format: ({
				  aSeaVirtualMachine pharoUiScript.
				  aSeaImage imageFile } collect: [ :a |
				  a fullName copyReplaceAll: ' ' with: '\ ' ]))
]

{ #category : #'as yet unclassified' }
SeaStarter >> virtualMachineRepository [

	^ SeaLocalRepository new virtualMachinesRepository
]

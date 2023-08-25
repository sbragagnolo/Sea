Class {
	#name : #SeaVirtualMachineRepository,
	#superclass : #SeaLocalRepository,
	#instVars : [
		'parent'
	],
	#category : #'Sea-Repository'
}

{ #category : #accessing }
SeaVirtualMachineRepository >> imagesRepository [

	^ parent imagesRepository
]

{ #category : #'instance creation' }
SeaVirtualMachineRepository >> newVirtualMachine: version [

	^ SeaVirtualMachine new
		  name: self name;
		  version: version;
		  repository: self;
		  directory:
			  self directory / ('TempOs_{1}' format: { version asString });
		  yourself
]

{ #category : #accessing }
SeaVirtualMachineRepository >> parent: aSeaVirtualMachineRepository [ 
	parent := aSeaVirtualMachineRepository
]

{ #category : #'as yet unclassified' }
SeaVirtualMachineRepository >> virtualMachine: anInteger osname: anOsName [

	| repo vm |
	repo := self repositoryFor: anInteger asString.
	(repo directory / anOsName) exists ifFalse: [
		self error:
			'No virtual machine for pharo ' , anInteger asString , ' OS: '
			, anOsName ].
	^ (repo newVirtualMachine: anInteger)
		  directory: repo directory / anOsName;
		  yourself
]

{ #category : #accessing }
SeaVirtualMachineRepository >> virtualMachinesRepository [

	^ self
]

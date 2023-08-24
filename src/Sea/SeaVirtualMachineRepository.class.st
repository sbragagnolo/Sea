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
SeaVirtualMachineRepository >> newVirtualMachine [

	| version |
	version := self directory basename asInteger.

	^ SeaVirtualMachine new
		  name: self name;
		  version: version;
		  repository: self;
		  directory:
			  self directory / ('TempOs_{1}' format: { version asString });
		  yourself
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

{ #category : #accessing }
SeaVirtualMachineRepository >> virtualMachinesRepository [

	^ self
]

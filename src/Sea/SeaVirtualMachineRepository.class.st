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

{ #category : #accessing }
SeaVirtualMachineRepository >> initialize [
	super initialize.
	directory := self class virtualMachinesRootDirectory 
]

{ #category : #accessing }
SeaVirtualMachineRepository >> virtualMachinesRepository [

	^ self
]

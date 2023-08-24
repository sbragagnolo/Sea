Class {
	#name : #SeaVirtualMachine,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'repository',
		'directory'
	],
	#category : #'Sea-Test'
}

{ #category : #accessing }
SeaVirtualMachine >> directory [
	^ directory
]

{ #category : #accessing }
SeaVirtualMachine >> directory: aFileReference [

	directory := aFileReference
]

{ #category : #accessing }
SeaVirtualMachine >> name: aString [ 
	name := aString 
]

{ #category : #accessing }
SeaVirtualMachine >> repository: aSeaVirtualMachineRepository [

	repository := aSeaVirtualMachineRepository
]

{ #category : #versions }
SeaVirtualMachine >> version: anInteger [ 
	version := anInteger 
]

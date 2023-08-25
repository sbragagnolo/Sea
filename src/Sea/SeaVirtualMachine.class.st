Class {
	#name : #SeaVirtualMachine,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'repository',
		'directory',
		'osname'
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

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> os [

	osname asLowercase = 'mac os' ifTrue: [
		^ OSPlatform current isMacOS
			  ifTrue: [ OSPlatform current ]
			  ifFalse: [ MacOSXPlatform new ] ].
	self error: 'Uknown os'
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> osname: aString [ 
	osname := aString.
]

{ #category : #accessing }
SeaVirtualMachine >> pharoScript [

	^ self directory / 'pharo'
]

{ #category : #accessing }
SeaVirtualMachine >> pharoUiScript [

	^ self directory / 'pharo-ui'
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> pharoVmFolder [

	^ self directory / 'pharo-vm'
]

{ #category : #accessing }
SeaVirtualMachine >> repository: aSeaVirtualMachineRepository [

	repository := aSeaVirtualMachineRepository
]

{ #category : #accessing }
SeaVirtualMachine >> version [
	^ version
]

{ #category : #versions }
SeaVirtualMachine >> version: anInteger [ 
	version := anInteger 
]

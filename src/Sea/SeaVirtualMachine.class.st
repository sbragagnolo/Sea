Class {
	#name : #SeaVirtualMachine,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'repository',
		'directory'
	],
	#category : #'Sea-Core'
}

{ #category : #accessing }
SeaVirtualMachine >> directory [
	^ directory
]

{ #category : #accessing }
SeaVirtualMachine >> directory: aFileReference [

	directory := aFileReference
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> missingFiles [

	^ {
		  self directory.
		  self pharoVersionFile.
		  self pharoVmFolder.
		  self osNameFile.
		  self pharoScript.
		  self pharoUiScript } reject: [ :f | f exists ]
]

{ #category : #accessing }
SeaVirtualMachine >> name [
	^ name
]

{ #category : #accessing }
SeaVirtualMachine >> name: aString [ 
	name := aString 
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> os [

	self osname asLowercase = 'mac os' ifTrue: [
		^ OSPlatform current isMacOS
			  ifTrue: [ OSPlatform current ]
			  ifFalse: [ MacOSXPlatform new ] ].
	self error: 'Uknown os'
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> osNameFile [

	^ self directory / 'os.name'
]

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> osname [

	| str |
	str := self osNameFile readStream upToEnd.
	^ str copyFrom: 1 to: (str size min: 10)
]

{ #category : #accessing }
SeaVirtualMachine >> pharoScript [

	^ self directory / 'pharo'
]

{ #category : #accessing }
SeaVirtualMachine >> pharoUiScript [

	^ self directory / 'pharo-ui'
]

{ #category : #accessing }
SeaVirtualMachine >> pharoVersion [

	^ self pharoVersionFile readStream upToEnd asNumber
]

{ #category : #accessing }
SeaVirtualMachine >> pharoVersionFile [

	^ (self directory / 'pharo.version') 
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

{ #category : #'as yet unclassified' }
SeaVirtualMachine >> vmBinary [

	OSPlatform current isMacOS ifTrue: [
		^ self directory / 'pharo-vm' / 'Pharo.app' / 'Contents' / 'MacOS'
		  / 'Pharo' ].
	self error: 'Unsupported platform'
]

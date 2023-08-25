Class {
	#name : #SeaRunningInstance,
	#superclass : #Object,
	#instVars : [
		'image',
		'virtualMachine',
		'process',
		'id'
	],
	#category : #'Sea-Core'
}

{ #category : #accessing }
SeaRunningInstance >> id [

	^ id
]

{ #category : #accessing }
SeaRunningInstance >> image [
	^ image
]

{ #category : #accessing }
SeaRunningInstance >> image: aSeaImage [ 
	image := aSeaImage
]

{ #category : #accessing }
SeaRunningInstance >> initialize [

	super initialize.
	id := UUID new
]

{ #category : #testing }
SeaRunningInstance >> isRunning [

	^ process ifNil: [ false ] ifNotNil: [ process isRunning ]
]

{ #category : #accessing }
SeaRunningInstance >> name [

	^ 'image:' , image name , 'vm:' , virtualMachine name
]

{ #category : #accessing }
SeaRunningInstance >> process: anOSSUnixSubprocess [ 
	process := anOSSUnixSubprocess
]

{ #category : #accessing }
SeaRunningInstance >> stop [

	self isRunning ifFalse: [ ^ self ].
	process terminate.
	process := nil
]

{ #category : #accessing }
SeaRunningInstance >> virtualMachine [
	^ virtualMachine
]

{ #category : #accessing }
SeaRunningInstance >> virtualMachine: aSeaVirtualMachine [ 
	virtualMachine := aSeaVirtualMachine
]

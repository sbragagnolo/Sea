Class {
	#name : #SeaStartTest,
	#superclass : #SeaAbstractTest,
	#instVars : [
		'image',
		'vm',
		'starter',
		'instance'
	],
	#category : #'Sea-Test'
}

{ #category : #running }
SeaStartTest >> setUp [

	super setUp.
	image := sea deployImageZip: self zipFile name: #test.
	vm := sea deployVmZip: self vmZipFile version: 110.
	starter := Sea starter. 
]

{ #category : #running }
SeaStartTest >> tearDown [

	instance stop.
	super tearDown
]

{ #category : #running }
SeaStartTest >> testStartPharoInstanceGetsARunningInstance [

	instance := starter startInstance: #test.
	self assert: instance isRunning.
	
]

{ #category : #running }
SeaStartTest >> testStartPharoInstanceWithName [
	" 
	Sea deployer eraseRepository 
	"

	instance := starter startInstance: #test.
	self assert: instance image name equals: #test.
	self assert: instance virtualMachine name equals: #'110'
]

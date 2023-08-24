Class {
	#name : #SeaStartTest,
	#superclass : #SeaAbstractTest,
	#instVars : [
		'image',
		'vm',
		'starter'
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
SeaStartTest >> testStartPharoInstanceWithName [

	| instance |
	instance := starter startInstance: #test.
	self assert: instance pid isNumber
]

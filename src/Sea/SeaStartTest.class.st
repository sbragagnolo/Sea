Class {
	#name : #SeaStartTest,
	#superclass : #SeaAbstractTest,
	#instVars : [
		'image'
	],
	#category : #'Sea-Test'
}

{ #category : #running }
SeaStartTest >> setUp [

	super setUp.
	image := sea deployImageZip: self zipFile name: #test
]

{ #category : #tests }
SeaStartTest >> testImageInstance [
	
]

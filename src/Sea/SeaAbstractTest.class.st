Class {
	#name : #SeaAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'sea'
	],
	#category : #'Sea-Test'
}

{ #category : #running }
SeaAbstractTest >> setUp [

	super setUp.
	sea := Sea deployer.
	
]

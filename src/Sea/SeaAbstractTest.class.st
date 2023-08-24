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

{ #category : #running }
SeaAbstractTest >> tearDown [

	super tearDown.
	sea eraseRepository
]

{ #category : #running }
SeaAbstractTest >> zipFile [

	^ 'pharo-local/iceberg/sbragagnolo/sea/resources/pharo.zip'
		  asFileReference
]

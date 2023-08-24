Class {
	#name : #SeaDeployerTest,
	#superclass : #SeaAbstractTest,
	#category : #'Sea-Test'
}

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesChangesFile [

	| image |
	image := sea deployZip: self zipFile name: #example.
	self assert: image changesFile exists
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesImageFile [

	| image |
	image := sea deployZip: self zipFile name: #example.
	self assert: image imageFile exists
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesMultipleVersions [

	| image1 image2 |
	image1 := sea deployZip: self zipFile  name: #example.
	self assert: image1 version equals: 1.
	self halt.
	image2 := sea deployZip: self zipFile  name: #example.
	self assert: image2 version equals: 2.
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesPharoVersion [

	| image |
	image := sea deployZip: self zipFile name: #example.
	self assert: image pharoVersion equals: 100
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesSeaImage [

	| image |
	image := sea deployZip: self zipFile name: #example.
	self assert: (image isKindOf: SeaImage)
]

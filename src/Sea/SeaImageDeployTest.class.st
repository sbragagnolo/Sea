Class {
	#name : #SeaImageDeployTest,
	#superclass : #SeaAbstractTest,
	#category : #'Sea-Test'
}

{ #category : #tests }
SeaImageDeployTest >> testDeployerProducesChangesFile [

	| image |
	image := sea deployImageZip: self zipFile name: #example.
	self assert: image changesFile exists
]

{ #category : #tests }
SeaImageDeployTest >> testDeployerProducesImageFile [

	| image |
	image := sea deployImageZip: self zipFile name: #example.
	self assert: image imageFile exists
]

{ #category : #tests }
SeaImageDeployTest >> testDeployerProducesMultipleVersions [

	| image1 image2 |
	image1 := sea deployImageZip: self zipFile  name: #example.
	self assert: image1 version equals: 1.

	image2 := sea deployImageZip: self zipFile  name: #example.
	self assert: image2 version equals: 2.
]

{ #category : #tests }
SeaImageDeployTest >> testDeployerProducesPharoVersion [

	| image |
	image := sea deployImageZip: self zipFile name: #example.
	self assert: image pharoVersion equals: 110
]

{ #category : #tests }
SeaImageDeployTest >> testDeployerProducesSeaImage [

	| image |
	image := sea deployImageZip: self zipFile name: #example.
	self assert: (image isKindOf: SeaImage)
]

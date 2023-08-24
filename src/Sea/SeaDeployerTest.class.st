Class {
	#name : #SeaDeployerTest,
	#superclass : #SeaAbstractTest,
	#category : #'Sea-Test'
}

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesChangesFile [

	| image |
	image := sea deployZip: 'pharo.zip' name: #example.
	self assert: image changesFile exists.
	
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesImageFile [

	| image |
	image := sea deployZip: 'pharo.zip' name: #example.
	self assert: image imageFile exists.
	
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesMultipleVersions [

	| image1 image2 |
	image1 := sea deployZip: 'pharo.zip' name: #example.
	self assert: image1 version equals: 1.
	image2 := sea deployZip: 'pharo.zip' name: #example.
	self assert: image2 version equals: 2.
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesPharoVersion [

	| image |
	image := sea deployZip: 'pharo.zip' name: #example.
	self assert: image pharoVersion equals: '11.0.0'
]

{ #category : #tests }
SeaDeployerTest >> testDeployerProducesSeaImage [

	| image |
	image := sea deployZip: 'pharo.zip' name: #example.
	self assert: (image isKindOf: SeaImage).
]
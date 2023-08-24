"
Entry point 
"
Class {
	#name : #Sea,
	#superclass : #Object,
	#category : #'Sea-Core'
}

{ #category : #convenience }
Sea class >> deployer [

	^ SeaDeployer new
]

{ #category : #'as yet unclassified' }
Sea class >> starter [

	^ SeaStarter new
]

Class {
	#name : #SeaService,
	#superclass : #Object,
	#instVars : [
		'imagesRepository',
		'virtualMachineRepository'
	],
	#category : #'Sea-Core'
}

{ #category : #deploy }
SeaService >> initialize [

	super initialize.
	imagesRepository := SeaLocalRepository new imagesRepository.
	virtualMachineRepository := SeaLocalRepository new
		                            virtualMachinesRepository
]

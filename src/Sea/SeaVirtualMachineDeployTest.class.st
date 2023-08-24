Class {
	#name : #SeaVirtualMachineDeployTest,
	#superclass : #SeaAbstractTest,
	#category : #'Sea-Test'
}

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesPharoScriptFile [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoScript exists
]

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesPharoUIScriptFile [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoUiScript exists
]

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesPharoVMFolder [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoVmFolder exists
]

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesVm [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: (vm isKindOf: SeaVirtualMachine)
]

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesVmMacOs [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm os isMacOS .
]

{ #category : #tests }
SeaVirtualMachineDeployTest >> testDeployerProducesVmVersion110 [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm version equals: 110.
	
]

Class {
	#name : #SeaVirtualMachineTest,
	#superclass : #SeaAbstractTest,
	#category : #'Sea-Test'
}

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesPharoScriptFile [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoScript exists
]

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesPharoUIScriptFile [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoUiScript exists
]

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesPharoVMFolder [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm pharoVmFolder exists
]

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesVm [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: (vm isKindOf: SeaVirtualMachine)
]

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesVmMacOs [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm os isMacOS .
]

{ #category : #tests }
SeaVirtualMachineTest >> testDeployerProducesVmVersion110 [

	| vm |
	vm := sea deployVmZip: self vmZipFile version: 110.
	self assert: vm version equals: 110.
	
]

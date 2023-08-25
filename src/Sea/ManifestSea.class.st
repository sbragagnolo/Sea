"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSea,
	#superclass : #PackageManifest,
	#category : #'Sea-Manifest'
}

{ #category : #'code-critics' }
ManifestSea class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#Sea)) #'2023-08-25T17:59:27.471997+02:00') )
]

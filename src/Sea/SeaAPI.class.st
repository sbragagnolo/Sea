Class {
	#name : #SeaAPI,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'vmAPI'
	],
	#category : #'Sea-Core'
}

{ #category : #initialization }
SeaAPI >> configureImageApi [

	self teapot
		POST: '/image/deploy' -> [ :req | self imageAPI deploy: req ];
		GET: '/image/getAll/<imageName>' -> [ :req |
				self imageAPI getAll: (self valueOrNil: #imageName request: req) ];
		GET: '/image/get/<imageName>/<version>' -> [ :req |
				self imageAPI
					get: (self valueOrNil: #imageName request: req)
					version: (self valueOrNil: #version request: req) ];
		GET: '/image/list' -> [ :req | self imageAPI list ];
		DELETE: '/image/deleteAll/<imageName>' -> [ :req |
				self imageAPI deleteAll:
						(self valueOrNil: #imageName request: req) ];
		DELETE: '/image/delete/<imageName>/<version>' -> [ :req |
				self imageAPI
					delete: (self valueOrNil: #imageName request: req)
					version: (self valueOrNil: #version request: req) ]
]

{ #category : #initialization }
SeaAPI >> configureInstanceApi [

	self teapot
		GET: '/instance/list' -> [ :req | self handleForgot: req ];
		GET: '/instance/list/<imageName>:<vmVersion>'
			-> [ :req | self handleForgot: req ];
		GET:
			'/instance/get/<instanceId>' -> [ :req | self handleForgot: req ];
		GET: '/instance/connection/<instanceId>'
			-> [ :req | self handleForgot: req ];
		POST:
			'/instance/start/<imageName>' -> [ :req | self handleForgot: req ];
		POST: '/instance/start/<imageName>/<vmName>'
			-> [ :req | self handleForgot: req ];
		POST:
			'/instance/stop/<instanceId>' -> [ :req | self handleForgot: req ];
		POST: '/instance/stopAll' -> [ :req | self handleForgot: req ];
		POST:
			'/instance/status/<instanceId>'
			-> [ :req | self handleForgot: req ]
]

{ #category : #initialization }
SeaAPI >> configureVMApi [

	self teapot
		POST: '/vm/deploy' -> [ :req | self vmAPI deploy: req ];
		GET: '/vm/list' -> [ :req | self vmAPI list: req ];
		GET: '/vm/getAll/<vmVersion>' -> [ :req |
				self vmAPI getAll: (self valueOrNil: #vmVersion request: req) ];
		GET: '/vm/get/<vmVersion>/<osName>' -> [ :req |
				self vmAPI
					get: (self valueOrNil: #vmVersion request: req)
					os: (self valueOrNil: #osName request: req) ];
		DELETE: '/vm/deleteAll/<vmVersion>' -> [ :req |
				self vmAPI deleteAll: (self valueOrNil: #vmVersion request: req) ];
		DELETE: '/vm/delete/<vmVersion>/<osName>' -> [ :req |
				self vmAPI
					delete: (self valueOrNil: #vmVersion request: req)
					osName: (self valueOrNil: #osName request: req) ]
]

{ #category : #initialization }
SeaAPI >> imageAPI [
	^ vmAPI ifNil: [ vmAPI := SeaImageApi new ]
]

{ #category : #initialization }
SeaAPI >> initialize [

	 self configureImageApi.
	 self configureVMApi.
	 self configureInstanceApi.
	
    self teapot start.
]

{ #category : #initialization }
SeaAPI >> instanceAPI [

	^ vmAPI ifNil: [ vmAPI := SeaInstanceApi new ]
]

{ #category : #initialization }
SeaAPI >> reset [

	teapot ifNotNil: [
		teapot stop.
		teapot := nil ]
]

{ #category : #initialization }
SeaAPI >> teapot [

	^ teapot ifNil: [ teapot := Teapot on ]
]

{ #category : #initialization }
SeaAPI >> valueOrNil: aKey request: req [

	^ req session attributeAt: aKey ifAbsent: nil
]

{ #category : #initialization }
SeaAPI >> vmAPI [
	^ vmAPI ifNil: [ vmAPI := SeaVMApi new ]
]

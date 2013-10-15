;A program to test the tri trac and arm

;in order from base to gripper
;Arm servo pins
base con P4
shoulder con P5
elbow con P6
wrist con P7
hand con P8
grip con P9
;Arm position limits
basemin con 0
basemax con 180
shouldermin con 0
shouldermax con 180
elbowmin con 0
elbowmax con 180
wristmin con 0 
wristmax con 180
handwrotmin con 0
handwrotmax con 180
gripclosed con 0
gripopen con 180
num con 0

;start of servo testing
;testes each servos range individually
servomove
	ENABLEHSERVO
	pause 5000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;rotate left then right
	HSERVO[base\-12000\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\12000\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;shoulder range movement with elbow movement
	HSERVO[base\0\0,shoulder\-12000\0,elbow\-12000\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\12000\0,elbow\12000\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;wrist range test
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\-12000\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\12000\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;hand rotation
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\-12000\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\12000\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;gripper opening and closing
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\-12000\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\12000\0]
	pause 1000
goto servomove

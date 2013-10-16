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
servo_test
	ENABLEHSERVO
	Serout s_out,i9600,["Setting Up",13]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 6000
	;rotate left then right
	Serout s_out,i9600,["Testing base",13]
	HSERVO[base\-12000\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\12000\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;shoulder range movement with elbow movement
	Serout s_out,i9600,["Testing Shoulder and Elbow",13]
	HSERVO[base\0\0,shoulder\-12000\0,elbow\-12000\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\12000\0,elbow\12000\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;wrist range test
	Serout s_out,i9600,["Testing Wrist",13]
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\-12000\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\12000\0,hand\0\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;hand rotation
	Serout s_out,i9600,["Testing Hand Rotation",13]
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\-12000\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\12000\0,grip\0\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\0\0]
	pause 1000
	;gripper opening and closing
	Serout s_out,i9600,["Testing gripper grippiness",13]
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\-12000\0]
	pause 1000
	HSERVO[base\0\0,shoulder\0\0,elbow\0\0,wrist\0\0,hand\0\0,grip\12000\0]
	pause 1000
motor_test
;to test thet each motor can rotate freely from full reverse to full forward
	Serout s_out,i9600,["Beggining motor test",13]
	speed var long
	For speed = -5000 to 5000 step 50
	HSERVO [0\(speed*2)\0,1\(speed*-2)\0]
	;FOR speed = 1 to 127
	;serout 0,i9600,[speed]
	;serout 0,i9600,[(speed+127)]
	pause 200
	serout s_out ,i9600,[DEC speed,13]
	next
	
goto servo_test

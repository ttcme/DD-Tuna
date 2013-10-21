;A program to test the tri trac and arm

;in order from base to gripper
;Arm servo pins
base con P3
shoulder con P4
elbow con P5
wrist con P6
hand con P7
grip con P8
speaker con P9
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
;Button pins
button_A con P12
button_B con P13
button_C con P14
;Notes for speaker test
nc con 261
nd con 294
ne con 329
nf con 349
ng con 391
ngs con 415
na con 440
nas con 455
nb con 466
nch con 523
ncsh con 554
ndh con 587
ndsh con 662
neh con 659
nfh con 698
nfsh con 740
ngh con 784
ngsh con 830
nah con 880
quiet con 1

notes Var long (18)
nleng Var long (18)

notes(0) = na
nleng(0) = 500
notes(1) = na
nleng(1) = 500
notes(2) = na
nleng(2) = 500
notes(3) = nf
nleng(3) = 350
notes(4) = nch
nleng(4) = 150
notes(5) = na
nleng(5) = 500
notes(6) = nf
nleng(6) = 350
notes(7) = nch
nleng(7) = 150
notes(8) = na
nleng(8) = 650

notes(9) = quiet
nleng(9) = 150

notes(10) = neh
nleng(10) = 500
notes(11) = neh
nleng(11) = 500
notes(12) = neh
nleng(12) = 500
notes(13) = nfh
nleng(13) = 350
notes(14) = nch
nleng(14) = 150
notes(15) = ngs
nleng(15) = 500
notes(16) = nf
nleng(16) = 350
notes(17) = nch
nleng(17) = 150
notes(18) = na
nleng(18) = 650


;Initial test mode selection. Acts as a menu for the other test modes
Startup
Serout s_out,i9600,["Select mode",13]
mode_select
	if in12 = 0 then servo_test 
	if in13 = 0 then motor_test
	if in14 = 0 then sound_test
	goto mode_select
	
;start of servo testing
;testes each servos range individually
servo_test
	ENABLEHSERVO
	Serout s_out,i9600,["Testing servos",13]
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
	;reset the arm postion to compact space
	HSERVO[base\0\0,shoulder\12000\0,elbow\12000\0,wrist\-6000\0,hand\0\0,grip\0\0]
	goto Startup
	
motor_test
;to test thet each motor can rotate freely from full reverse to full forward
	Serout s_out,i9600,["Beggining motor test",13]
	speed var long
	For speed = -5000 to 5000 step 50 ;to allow gradiented movement
	HSERVO [0\(speed*2)\0,1\(speed*-2)\0]
	;FOR speed = 1 to 127
	;serout 0,i9600,[speed]
	;serout 0,i9600,[(speed+127)]
	pause 200
	serout s_out ,i9600,[DEC speed,13]
	next
	;full reverse to full forward
	HSERVO [0\-5000\0,1\-5000\0]
	pause 1000
	Hservo [0\5000\0,1\5000\0]
	pause 1000
	HSERVO [0\0\0,1\0\0] ;stop
goto Startup

sound_test ;plays the imperial march in 8 bit
	Serout s_out,i9600,["Feel the FORCE!",13]
	note_numb var byte
		for note_numb = 0 to 18
			sound speaker, [notes(note_numb)\nleng(note_numb)]
			pause 20
		next
	
goto Startup

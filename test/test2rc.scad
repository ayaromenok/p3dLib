include <../lib2/lib2.scad> 
include <../lib2/lib2_motor.scad>
include <../lib2/lib2_prop.scad>
include <../lib2/lib2_servo.scad>


servoSg90(0,-30,0);

blMotor2212(0,50,0, isXSupport=true);
blMotor2212_bot(-40,50,0);
blMotor2212_botX(-80,50,0);
prop6035(60,50,0,   0,0,20);
prop8060(120,50,0,   0,0,20);
prop5045_3(180,50,0,   0,0,0);
prop5147_3(210,50,0,   0,0,-15);

blMotor1104(0,0,0);
blMotor1104_top(-30,0,0);
blMotor1104_bot(-60,0,0);
prop2345_3(60,0,0,  0,0,-30);

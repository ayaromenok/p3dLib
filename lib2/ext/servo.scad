include <../lib2.scad>

//servoSg90();
//SG90, weight 10.7gramm
module servoSg90(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        
        yCube(22.4,12.5,22.8,   0,0,0);
        yCyl(12.5/2,4.5,        -5,0,13.65);
        yCyl(2.5,4.5,        -5,0,18);
        yCube(2,5,7,         -12,0,-8);
        difference(){
            yCube(31.8,12.5,2, 0,0,5.7);
            yCyl(1,5,   27.7/2,0,5.7);
            yCyl(1,5,   -27.7/2,0,5.7);
        }//difference
    }//transform
}//module

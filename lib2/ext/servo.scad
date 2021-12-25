include <../lib2.scad>

//servoSg90();
//servoSg90_cut();
//SG90, weight 10.7gramm
module servoSg90(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        
        yCube(22.8,12.7,22.8,   0,0,0);
        yCyl(12.5/2,4.5,        -5,0,13.65);
        yCyl(2.5,4.5,        -5,0,18);
        yCube(2,5,10,         -12,0,-9.5);
        difference(){
            yCube(31.8,12.5,2, 0,0,5.7);
            yCyl(1,5,   27.7/2,0,5.7);
            yCyl(1,5,   -27.7/2,0,5.7);
        }//difference
    }//transform
}//module


module servoSg90_cut(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        
        yCube(23.6,13.2,22.8,   0,0,0);
        yCyl(12.5/2,4.5,        -5,0,13.65);
        yCyl(2.5,4.5,        -5,0,18);
        yCube(4,13.2,10,         -11,0,-9.5);
        
        //holder
        yCube(32.6,13.2,2, 0,0,5.7);
        yCyl(0.7,7,   27.7/2,0,2.7);
        yCyl(0.7,7,   -27.7/2,0,2.7);
        
    }//transform
}//module

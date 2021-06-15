include <lib2.scad>

//prop2345_3();

//weight 1.8g
module prop2345_3(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(7.15,5);
            yCyl(0.75,10,    0,0,0);
            yCyl(1.1,10,    4.5,0,0);
            yCyl(1.1,10,    -4.5,0,0);
            yCyl(1.1,10,    0,2.5,0);
            yCyl(1.1,10,    0,-2.5,0);
            
        }//diff        
        for (i=[0:120:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(23,10,1,  17.5,0,0,  25,0,0);
                } else {
                    yCube(23,10,1,  17.5,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module

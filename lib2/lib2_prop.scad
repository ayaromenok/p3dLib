include <lib2.scad>

//prop8040_3();
//prop7040_3();
//prop2345_3();
//prop6035();
//prop8060();
//prop5045_3();
//prop5147_3();


//GemFan CW/CCW, weight 10.51 https://www.aliexpress.com/item/1005003071929418.html
module prop8040_3(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(8,7.5);
            yCyl(2.5,12,    0,0,0);            
        }//diff        
        for (i=[0:120:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(99,20,1,  52,0,0,  25,0,0);
                } else {
                    yCube(99,20,1,  52,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module

//noname CW/CCW https://www.aliexpress.com/item/4001364160987.html
module prop7040_3(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(7,8.26);
            yCyl(2.5,12,    0,0,0);            
        }//diff        
        for (i=[0:120:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(175/2,15,1,  45,0,0,  25,0,0);
                } else {
                    yCube(175/2,15,1,  46,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module

//DALPROP SpitFire T5147.5, weight 4.1g
module prop5147_3(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(6.1,10);
            yCyl(3,12,    0,0,0);            
        }//diff        
        for (i=[0:120:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(60,10,1,  35,0,0,  25,0,0);
                } else {
                    yCube(60,10,1,  35,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module

//KingKong 5045 V2 Bullnose, weight 5.7g
module prop5045_3(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(6.1,10);
            yCyl(3,12,    0,0,0);            
        }//diff        
        for (i=[0:120:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(58,10,1,  35,0,0,  25,0,0);
                } else {
                    yCube(58,10,1,  35,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module

//GemFan 8060, weight 6.8g
module prop8060(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(6.1,10);
            yCyl(3,12,    0,0,0);            
        }//diff        
        for (i=[0:180:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(96,10,1,  54,0,0,  25,0,0);
                } else {
                    yCube(96,10,1,  54,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module


//GemFan 6035, weight 3.1g
module prop6035(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ccw=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCyl(6.1,10);
            yCyl(3,12,    0,0,0);            
        }//diff        
        for (i=[0:180:360]){
            rotate([0,0,i])
                if (ccw) {
                    yCube(70,10,1,  41,0,0,  25,0,0);
                } else {
                    yCube(70,10,1,  41,0,0,  -25,0,0);
                }//if
            }//for
    }//transform
}//module


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

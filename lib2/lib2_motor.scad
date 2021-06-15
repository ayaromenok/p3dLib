include <lib2.scad>

//blMotor1104();
//blMotor1104_bot(20,0,0);
//blMotor1104_top(-20,0,0);

module blMotor1104(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //shaft
        yCyl(0.75, 5,    0,0,7);
        //motor
        difference(){
            yCyl(7.15,9);
            yCyl(1.1,10,    4.5,0,0);
            yCyl(1.1,10,    -4.5,0,0);
            yCyl(1.1,10,    0,4.5,0);
            yCyl(1.1,10,    0,-4.5,0);
            
        }//diff        
        //support
        yCyl(3,4,   0,0,-5);
        yCyl(2,4,   0,0,-6);
        difference(){
            yCube(7.8,7.8, 1,   0,0,-7, 0,0,45);
            yCyl(0.7,10,    4.2,0,-8);
            yCyl(0.7,10,    -4.2,0,-8);
            yCyl(0.7,10,    0,4.2,-8);
            yCyl(0.7,10,    0,-4.2,-8);            
        }//difference
    }//transform
}//module

module blMotor1104_bot(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        
        difference(){
            yCube(9,9, 3,   0,0,0, 0,0,45);
            yCyl(0.9,10,    4.2,0,0);
            yCyl(0.9,10,    -4.2,0,0);
            yCyl(0.9,10,    0,4.2,0);
            yCyl(0.9,10,    0,-4.2,0); 
            yCyl(2.5,10,   0,0,0);           
        }//difference
    }//transform
}//module

module blMotor1104_top(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //motor
        difference(){
            yCyl(7.15,3);
            yCyl(1.1,10,    4.5,0,0);
            yCyl(1.1,10,    -4.5,0,0);
            yCyl(1.1,10,    0,4.5,0);
            yCyl(1.1,10,    0,-4.5,0);
            yCyl(0.9, 10,    0,0,0);    
        }//diff        
        
    }//transform
}//module


include <../lib2.scad>

//blMotor2212(isXSupport=true);
//blMotor2212_botX(50,0,0);
//blMotor2212_bot(-50,0,0);
//blMotor1104();
//blMotor1104_bot(20,0,0);
//blMotor1104_top(-20,0,0);


module blMotor2212_bot(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){            
            yCyl(27.7/2,4, 0,0,-15);
            //holes
            yCyl(5,10,  0,0,-15);            
            yCyl(1.8,10,    9.5,0,-15);
            yCyl(1.8,10,    -9.5,0,-15);
            yCyl(1.8,10,    0,8,-15);
            yCyl(1.8,10,    0,-8,-15);            
            //cooling
            yCyl(9,10,  12,12,-15);
            yCyl(9,10,  12,-12,-15);
            yCyl(9,10,  -12,12,-15);
            yCyl(9,10,  -12,-12,-15);
        }//diff                
        
    }//transform
}//module

module blMotor2212_botX(px=0,py=0,pz=0, rx=0,ry=0,rz=0, height=4){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        {
            difference(){
                yMinkCubeCyl(40,7.4,height,3.6,  0,0,-17);                
                yCyl(1.7, height+6,   33/2,0,-16);
                yCyl(1.7, height+6,   -33/2,0,-16);
            }//difference
            difference(){
                yMinkCubeCyl(7.4,40,height,3.6,  0,0,-17);                
                yCyl(1.7, height+6,   0,33/2,-16);
                yCyl(1.7, height+6,   0,-33/2,-16);
            }
        }        
    }//transform
}//module

module blMotor2212(px=0, py=0, pz=0, rx=0, ry=0, rz=0, isXSupport=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        //shaft
        yCyl(3.175/2, 37,    0,0,5);
        //motor
        difference(){
            union(){
                yCyl(27.7/2,26);
                yCyl(4.5,28,  0,0,0.5);
            }//union
            yCyl(1.5,10,    9.5,0,-10);
            yCyl(1.5,10,    -9.5,0,-10);
            yCyl(1.5,10,    0,8,-10);
            yCyl(1.5,10,    0,-8,-10);            
        }//diff        
        //support
        if (isXSupport)
        {
            difference(){
                yMinkCubeCyl(40,7.4,2,3.6,  0,0,-14);
                
                yCyl(1.7, 10,   33/2,0,-14);
                yCyl(1.7, 10,   -33/2,0,-14);
            }//difference
            difference(){
                yMinkCubeCyl(7.4,40,2,3.6,  0,0,-14);
                
                yCyl(1.7, 10,   0,33/2,-14);
                yCyl(1.7, 10,   0,-33/2,-14);
            }
        }        
    }//transform
}//module

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


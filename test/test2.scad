include <../lib2/lib2.scad>

yVersion();

testCyl();
testSphere(py=2);
testCube(py=4);
testCylRotate(py=6);
//yCyl(10.5,10,    10,5,0,     0,40,0, fn=8);

//cylinder(10, 5,5, $fa=120,$fs=0.5, $fn=12);
//circle(5, $fa=0.1, $fs=0.4);

//yCube(szx=5, px=10);
//yPoly(p=[[-3,0], [3,0], [1,3]], py=-5);
//ySec(r=7);
//yArc(r=10);
//yCyl(rb=2, rt=1.5, px=-10, pz=-2, ry=30);
//yCyl2(rb=2, rt=1.5, px=-15, pz=-2, ry=30);
//ySphere(r=1, py=-10, ry=30);

//longeron();
//gun();

module testCyl( px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1){
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        yCyl(1,1,   px=-2.1, fs=0.1);
        yCyl(1,1);
        yCyl(1,1,   px=2.1, $fn=3);
    }//transform
}//module testCyl

module testSphere( px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1){
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        ySphere(1, -2.1,0,0, fs=0.1);
        ySphere(1, 0,0,0);
        ySphere(1, 2.1,0,0, $fn=5);
    }//transform
}//module testSphere

module testCube( px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1){
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        yCube(1,1,1,   px=-2.1);
        yCube(1,1,1);
        yCube(1,1,1,   px=2.1,pz=1,rx=30);
    }//transform
}//module testCube

module testCylRotate( px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1){
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        yCyl(1,1,   px=-4.2, cnt=false);
        yCyl(1,1,   px=-2.1,   rx=30 );
        yCyl(1,1);
        yCyl(1,1,   px=2.1,pz=1,    rx=30);
        yCyl(1,1,   px=4.2,pz=1,    rx=30, cnt=false);
    }//transform
}//module testCylRotate

//test modules
module gun(){
    difference(){
        union(){
            yCyl(szz=15, rb=7, rt=6, pz=7.5);
            yCyl(szz=22, rb=5, rt=5, pz=11);
        }//union
        yCyl(szz=32, rb=3, rt=3, pz=16);        
    }//diff
    yCube(szx=6, szy=0.45, szz=6, px=8, pz=3);
    yCube(szx=12, szy=12, szz=0.4, px=14, pz=0.2);
    
    yCube(szx=8, szy=0.45, szz=6, px=-8, pz=3);
    yCube(szx=12, szy=12, szz=0.4, px=-14, pz=0.2);
    
    yCube(szx=0.45, szy=6, szz=6, py=8, pz=3);
    yCube(szx=12, szy=12, szz=0.4, py=14, pz=0.2);
    
    yCube(szx=0.45, szy=6, szz=6, py=-8, pz=3);
    yCube(szx=12, szy=12, szz=0.4, py=-14, pz=0.2);
}//module gun
    
module longeron(){
    yCube(szx=100, szy=0.85, szz=0.5);
    yCube(szx=100, szy=0.85, szz=0.55, pz=3);

    yCube(szx=2, szy=0.85, szz=3, px=-50, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=-45, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=-35, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=-20, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=5, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=35, pz=1.5);
    yCube(szx=2, szy=0.85, szz=3, px=50, pz=1.5);
}//module longeron
include <../scad/basic.scad>

yVersion();

yCube(szx=5, px=10);
yPoly(p=[[-3,0], [3,0], [1,3]], py=-5);
ySec(r=7);
yArc(r=10);
yCyl(rb=2, rt=1.5, px=-10, pz=-2, ry=30);
yCyl2(rb=2, rt=1.5, px=-15, pz=-2, ry=30);
ySphere(r=1, py=-10, ry=30);

//longeron();
//gun();

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
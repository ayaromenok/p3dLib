
//yCube(szx=5, py=3, rz=30, mx=1, clr="red");
//yCyl(px=7, py=5, rb=3, clr="green");
//yPoly(p=[[-5,0],[5,0],[0,5]],szz=3);
//ySec(r=5);
//yArc(r=15, px=5);

//px - Position X
//rx - Rotation X
//sx - Scale X
//mx - Mirror X
//szx - SiZe X
module yVersion(){
    echo("\n\n\t version: 0.1.1.20200211\n\n");
}
module yCube(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, szx=1, szy=1, szz=1, clr = "grey") {
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        cube([szx, szy, szz], center=true);    
}//yCube

module ySphere(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, r=1, clr = "grey", fn = ($preview ? 4:8)) {
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        sphere( r, $fn=fn*((r>2)?r:2));    
}//yCube

//rb - Radius Bottom, 
//rt - Radius Top
module yCyl(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, rb=1, rt=1, szz=1, clr = "grey", fn = ($preview ? 2:8) ) {
    _r = (rb>rt)?rb:rt;
    mirror([mx,my,mz])
    translate([px, py, (pz-szz/2)])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        cylinder(szz, rb, rt, $fn=fn*((_r>3)?_r:3));    
}//yCyl

module yCyl2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, rb=1, rt=1, szz=1, clr = "grey", fn = ($preview ? 2:8) ) {    
    _r = (rb>rt)?rb:rt;
       
    mirror([mx,my,mz])
    rotate([rx,ry,rz])
    translate([px, py, (pz-szz/2)])
    scale([sx,sy,sz])
    color(clr)
        cylinder(szz, rb, rt, $fn=fn*((_r>3)?_r:3));    
}//yCyl2

//p = [[x0,y0], [x1,y1], [x2,y2]]
module yPoly(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, p=[[0,0],[10,0],[0,10]], szz=1, clr = "grey") {
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        linear_extrude(szz)
            polygon(p);
}//yCube

//https://openhome.cc/eGossip/OpenSCAD/SectorArc.html
module ySec(r=5, a=[45,135], szz=1, fn=($preview ? 3:10), px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey") {
    _r = r / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(_a = [a[0] : step : a[1] - 360]) 
            [_r * cos(_a), _r * sin(_a)]
        ],
        [[_r * cos(a[1]), _r * sin(a[1])]]
    );

    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        linear_extrude(szz)
            difference() {
                circle(r, $fn = r*fn);
                polygon(points);
            }//diff
}//module ySec

module yArc(r=5, a=[45,135], w=1, szz=1, fn=($preview ? 3:10), px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey"){
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        difference(){
            ySec(r=r+w, a=a, szz=szz, fn=fn);
            ySec(r=(r), a=[a[0]-0.1, a[1]+0.1], szz=(szz+2), pz=-1, fn=fn);
        }//diff
}


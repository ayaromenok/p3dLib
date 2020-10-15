
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
    echo("\t\t\t\tp3dLib: 0.2.0.20201015");
}


module yCube(szx=1, szy=1, szz=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey") {
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        cube([szx, szy, szz], center=true);    
}//yCube


module ySphere(r=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey", fa=($preview ? 12:2), fs=($preview ? 2:0.4), $fn=0) {
    //echo ("sph:","fa", fa, "\t fs:", fs,"\t$fn", $fn);
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)    
    if ($fn==0){        
        sphere( r, $fa=fa, $fs=fs);    
    }else{                
        sphere(r);        
    }//$fn
}//ySphere

//r - one radius
//rb - Radius Bottom, 
//rt - Radius Top
module yCyl(r=0, szz=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, rb=1, rt=1, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0, cnt=true ) {
    
    rb = (r!=0)?r:rb;
    rt = (r!=0)?r:rt;
    _r = (rb>rt)?rb:rt;    
    
    //echo ("cyl","fa", fa, "\t fs:", fs,"\t$fn", $fn);
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)    
    if ($fn==0){        
        cylinder(szz, rb, rt,  $fa=fa, $fs=fs, center=cnt);            
    } else {        
        cylinder(szz, rb, rt, center=cnt);            
    }//$fn
}//yCyl

//p = [[x0,y0], [x1,y1], [x2,y2]]
module yPoly(p=[[0,0],[10,0],[0,10]], szz=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey") {
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        linear_extrude(szz)
            polygon(p);
}//yCube

module ySec(r=1, a=[30,-30], szz=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0) {
    //echo("angle",a, "r", r);
    
    if ((a[0]-a[1])>180){
        echo ("\t\t\t\tERROR:Sum of Sec/Arc more than a 180 degree", (a[0]-a[1]), a);
        }
    if (a[0]==a[1]){
        echo ("\t\t\t\tERROR:Angles start/end should be different", a);
        }
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr){
        translate([0,0,-szz/2])
        linear_extrude(szz)
        difference(){    
            if ($fn==0){  
                circle(r,  $fa=fa, $fs=fs);            
            } else {        
                circle(r);            
            }//$fn
        rotate([0,0,(90+a[0])])            
        translate([r/2,0])        
            square([r,r*2], center=true);
        rotate([0,0,(90+a[1])])            
        translate([-r/2,0])        
            square([r,r*2], center=true);
        }//diff
    }//transform    
}//module ySec

module yArc(r=1, a=[45,-30], w=0.5, szz=1, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0){
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        difference(){
            ySec(r, a, szz, fa=fa, fs=fs, $fn=$fn);
            yCyl((r-w),szz+0.1,, fa=fa, fs=fs, $fn=$fn);
        }//diff
}

module yMinkCubeCyl(szx=3, szy=3, szz=3, r=1,px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0) {
    if (r*2>szx){
        echo ("\t\t\t\tERROR:Fillet size x2 bigger than object X size itself", r*2, szx);
        }
    if (r*2>szy){
        echo ("\t\t\t\tERROR:Fillet size x2 bigger than object Y size itself", r*2, szy);
        }        
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        minkowski(){
            cube([szx-2*r, szy-2*r, szz-0.05], center=true);    
            yCyl(r, szz=0.05, fa=fa, fs=fs, $fn=$fn);
        }
}//yMinkCubeCyl

module yMinkCubeSphere(szx=3, szy=3, szz=3, r=1,px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0) {
    if (r*2>szx){
        echo ("\t\t\t\tERROR:Fillet size x2 bigger than object X size itself", r*2, szx);
        }
    if (r*2>szy){
        echo ("\t\t\t\tERROR:Fillet size x2 bigger than object Y size itself", r*2, szy);
        }    
    if (r*2>szz){
        echo ("\t\t\t\tERROR:Fillet size x2 bigger than object Z size itself", r*2, szz);
        }                
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        minkowski(){
            cube([szx-2*r, szy-2*r, szz-2*r], center=true);    
            ySphere(r, fa=fa, fs=fs, $fn=$fn);
        }
}//yMinkCubeSphere

module yMinkCylSphere(r=0, szz=1, rr=0.2, px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, mx=0, my=0, mz=0, rb=1, rt=1, clr = "grey", fa=($preview ? 12:0.1), fs=($preview ? 2:0.4), $fn = 0, cnt=true ) {
    if (r>0){
        if (rr>=r){
            echo ("\t\t\t\tERROR:Fillet size bigger than object Radius itself", rr, r);
        }        
    }else {
        if (rr>=rb){
            echo ("\t\t\t\tERROR:Fillet size bigger than object Bottom Radius itself", rr, rb);
        }
        if (rr>=rt){
            echo ("\t\t\t\tERROR:Fillet size bigger than object Top Radius itself", rr, rt);
        }
    }//r>0
    if (2*rr>szz){
        echo ("\t\t\t\tERROR:Fillet size bigger than object Z size itself", r, szz);
    }
    mirror([mx,my,mz])
    translate([px, py, pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    color(clr)
        minkowski(){
            if (r>0){
                yCyl(r=(r-rr), szz=(szz-2*rr), cnt=cnt, fa=fa, fs=fs, $fn=$fn);
            }else{
                yCyl(rb=(rb-rr), rt=(rt-rr), szz=(szz-2*rr), cnt=cnt, fa=fa, fs=fs, $fn=$fn);
            }
        ySphere(rr, fa=fa, fs=fs, $fn=$fn);
        }    
}//yMinkCylSphere



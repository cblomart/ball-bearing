module ballbearing(inner,outer,d,gap=0.2) {
    difference() {
        union() {
            difference() {
                cylinder(d=outer,h=d,$fn=30);
                cylinder(d=(outer+inner+d)/2,h=d,$fn=30);
            }
            difference() {
                cylinder(d=(outer+inner-d)/2,h=d,$fn=30);
                cylinder(d=inner,h=d,$fn=30);
            }
        }
        translate([0,0,d/2]) rotate_extrude() translate([(inner+outer)/4, 0, 0]) circle(d = (d+2*gap), $fn=15);
    }
    a = 2 * asin(d/((inner+outer)/2));
    b = round(360 / a);
    c = 360 / b;
    for (e = [0:c:360]) {
        rotate([0,0,e]) translate([(inner+outer)/4,0,d/2]) sphere(d=d,$fn=30);
    }
}

ballbearing(inner=25,outer=45,d=6);
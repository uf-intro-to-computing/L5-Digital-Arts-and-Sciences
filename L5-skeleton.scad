// Skeleton Code for UF EGN 4932
// Units in mm

_DELTA    = 0.01;

WIDTH     = 151;
HEIGHT    = 90;
THICKNESS = 2;
MARGIN    = 2;

// Create the base solid here
module main() {
    difference() {
        cube([WIDTH, HEIGHT, THICKNESS]);
        translate([MARGIN, MARGIN, -_DELTA])
            cube([WIDTH-2*MARGIN, HEIGHT-2*MARGIN, THICKNESS+2*_DELTA]);
    }
}

module ring(r_outer, r_inner, thickness=THICKNESS) {
    difference() {
        cylinder(thickness, r_outer, r_outer);
        translate([0, 0, -_DELTA])
            cylinder(thickness+2*_DELTA, r_inner, r_inner);
    }
}

// The size of the rings
Ro = 5.0;
Ri = 4.5;
// The number of rings to generate in the x and y axes
Nx = 20;
Ny = 12;
// The spacing between rings
Dx = (WIDTH-MARGIN-2*Ro)/Nx;
Dy = (HEIGHT-MARGIN-2*Ro)/Ny;
// Recursively generate the pattern here
module pattern() {
    translate([Ro+MARGIN/2, Ro+MARGIN/2, 0])
    for(i = [0 : 1 : Nx]) {
        for(j = [0 : 1 : Ny]) {
            translate([i*Dx, j*Dy, 0])
                ring(Ro, Ri);
        }
    }
}

main();
pattern();
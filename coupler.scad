led_height = 6.5 - 4;
fiber_height = 3;
height = led_height + fiber_height;
union() {
    difference() {
        union() {
            cylinder($fn=256, h=height, r=10);
            difference() {
                translate([0, 0, -2.5])
                    cylinder($fn=256, h=2.5, r=10);
                translate([0, 0, -2.5])
                    cube(size = [6, 6, 5], center=true);
            }
        }
        translate([0, 0, fiber_height])
            cylinder($fn=256, h=led_height + 1, r=2.5);
        translate([0, 0, -1.5])
            cylinder($fn=256, h=fiber_height + 3, r=1.5);
    }
}
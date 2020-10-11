length = 30;
height = 1;
radiusL = 25;
offsetL = 8;
widthL = sqrt(pow(radiusL,2)-pow(offsetL,2));
radiusS = radiusL/2;
offsetS = 4.5;
widthS = sqrt(pow(radiusS, 2)-pow(offsetS,2));
size = radiusL+offsetL+length+radiusS-offsetS;
scale = size/12;

module form() {
    union() {
        difference() {
            cylinder($fn=256, h=height, r=radiusL);
            translate([radiusL+offsetL, 0, 0])
                cube(size = [2*radiusL, 2*radiusL, 4], center=true);
        }

        points = [
        [      0,  -widthL,       0 ],  //0
        [ length,  -widthS,       0 ],  //1
        [ length,   widthS,       0 ],  //2
        [      0,   widthL,       0 ],  //3
        [      0,  -widthL,  height ],  //4
        [ length,  -widthS,  height ],  //5
        [ length,   widthS,  height ],  //6
        [      0,   widthL,  height ]]; //7
  
        faces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]]; // left

        translate([offsetL, 0, 0])  
            polyhedron(points, faces);

        translate([length+offsetL-offsetS, 0, 0]) {
            difference() {
                cylinder($fn=128, h=height, r=radiusS);
                translate([-(radiusS-offsetS), 0, 1])
                    cube(size = [2*radiusS, 2*radiusS, 4], center=true);
            }
        }
    }
}

difference() {
    union() {
        form();
        translate([0, 0, 1]) scale(v = [.85, .85, 2]) form();
        translate([0, 0, 3]) form();
    }
    translate([(offsetL+length+radiusS-offsetS)/2-radiusL/2, 0, 0])
        cube(size = [scale, scale, 16], center=true);
    cylinder($fn=128, h=16, r=5, center=true);
    translate([offsetL+length-offsetS, 0, 0])
        cylinder($fn=128, h=16, r=5, center=true);
}
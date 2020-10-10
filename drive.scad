union() {
    difference() {
        cylinder(h=1, r=25);
        translate([30, 0, 0])
            cube(size = [50, 50, 4], center = true);
    }

    width = sqrt(pow(25, 2)-pow(5,2));
    width2 = sqrt(pow(12.5, 2)-pow(4.5,2));

    CubePoints = [
    [  0,  -width,  0 ],  //0
    [ 25,  -width2,  0 ],  //1
    [ 25,  width2,  0 ],  //2
    [  0,  width,  0 ],  //3
    [  0,  -width,  1 ],  //4
    [ 25,  -width2,  1 ],  //5
    [ 25,  width2,  1 ],  //6
    [  0,  width,  1 ]]; //7
  
    CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left

    translate([5, 0, 0])  
        polyhedron( CubePoints, CubeFaces );

    translate([5+25-4.5, 0, 0]) {
        difference() {
            cylinder(h=1, r=12.5);
            translate([-8, 0, 1])
                cube(size = [25, 25, 4], center = true);
        }
    }
}
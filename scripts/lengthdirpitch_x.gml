///lengthdirpitch_x(len, dir, pitch)
var vect_z = lengthdirpitch_z(argument0, argument1, argument2);
var vect_xy = sqrt(argument0*argument0 - vect_z*vect_z);
return lengthdir_x(vect_xy, argument1);

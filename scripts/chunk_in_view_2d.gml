///chunk_in_view_2d(chunk_x, chunk_y)
var player_x = obj_player.x;
var player_y = obj_player.y;
if((player_x div 16 == argument0) && (player_y div 16 == argument1)) {
    return true;
}
var angle_left = obj_player.dir + 45;
var angle_right = obj_player.dir - 45;
var chunk_angles = array_create(4);
chunk_angles[0] = point_direction(player_x, player_y, argument0*16, argument1*16);
chunk_angles[1] = point_direction(player_x, player_y, argument0*16 + 16, argument1*16);
chunk_angles[2] = point_direction(player_x, player_y, argument0*16, argument1*16 + 16);
chunk_angles[3] = point_direction(player_x, player_y, argument0*16 + 16, argument1*16 + 16);
for(var i=0; i < 4; i++) {
    if((angle_difference(chunk_angles[i], angle_left) < 0) && (angle_difference(angle_right, chunk_angles[i]) < 0)) {
        return true;
    }
}
return false;

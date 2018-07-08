///chunk_in_view(chunk_x, chunk_y)
var chunk_x = argument0;
var chunk_y = argument1;
var player_x = obj_player.x;
var player_y = obj_player.y;
var player_z = obj_player.z + 1.7;
var fov = 45;
if((player_x div 16 == chunk_x) && (player_y div 16 == chunk_y)) {
    return true;
}
var angle_top = obj_player.pitch + fov/2;
var len_hor = (render_distance * 16 + 24) * tan(degtorad((fov/2) * browser_width/browser_height));
var len_vert = (render_distance * 16 + 24) / cos(degtorad(fov/2));
var vertices;
vertices[0, 0] = player_x;
vertices[0, 1] = player_y;

var center_x = lengthdirpitch_x(render_distance * 16 + 24, obj_player.dir, obj_player.pitch) + player_x;
var center_y = lengthdirpitch_y(render_distance * 16 + 24, obj_player.dir, obj_player.pitch) + player_y;
var top_x = lengthdirpitch_x(len_vert, obj_player.dir, angle_top) + player_x;
var top_y = lengthdirpitch_y(len_vert, obj_player.dir, angle_top) + player_y;
var vect_xr = lengthdir_x(len_hor, obj_player.dir - 90);
var vect_yr = lengthdir_y(len_hor, obj_player.dir - 90);
var vect_xt = top_x - center_x;
var vect_yt = top_y - center_y;

vertices[1, 0] = center_x + vect_xr + vect_xt;
vertices[1, 1] = center_y + vect_yr + vect_yt;

vertices[2, 0] = center_x - vect_xr - vect_xt;
vertices[2, 1] = center_y - vect_yr - vect_yt;

vertices[3, 0] = center_x + vect_xr - vect_xt;
vertices[3, 1] = center_y + vect_yr - vect_yt;

vertices[4, 0] = center_x - vect_xr + vect_xt;
vertices[4, 1] = center_y - vect_yr + vect_yt;

return check_chunk_collision(chunk_x, chunk_y, vertices);

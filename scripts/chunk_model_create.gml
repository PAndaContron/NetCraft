///chunk_model_create(world, coords, tex_map, tex_increment)
var model = d3d_model_create();
var chunk = argument0[? argument1];
var coords_xp = array_clone(argument1);
coords_xp[0]++;
var coords_xn = array_clone(argument1);
coords_xn[0]--;
var coords_yp = array_clone(argument1);
coords_yp[1]++;
var coords_yn = array_clone(argument1);
coords_yn[1]--;
var chunk_xp = argument0[? coords_xp];
var chunk_xn = argument0[? coords_xn];
var chunk_yp = argument0[? coords_yp];
var chunk_yn = argument0[? coords_yn];
var tex_map = argument2;
var tex_inc = argument3;
var prev_layer = array_create_2d(16, 16, "air");
d3d_model_primitive_begin(model, pr_trianglelist);
for(var i=255; i >= 0; i--) {
    var layer = chunk[| i];
    var next_layer = chunk[| i-1];
    var layer_xp = array_create_2d(16, 16, "air");
    var layer_xn = array_create_2d(16, 16, "air");
    var layer_yp = array_create_2d(16, 16, "air");
    var layer_yn = array_create_2d(16, 16, "air");
    if(!is_undefined(chunk_xp)) layer_xp = chunk_xp[| i];
    if(!is_undefined(chunk_xn)) layer_xn = chunk_xn[| i];
    if(!is_undefined(chunk_yp)) layer_yp = chunk_yp[| i];
    if(!is_undefined(chunk_yn)) layer_yn = chunk_yn[| i];
    for(var j=0; j < 16; j++) {
        for(var k=0; k < 16; k++) {
            if(block_get_property(layer[j, k], "texture", false) != "none") {
                var tex_loc = tex_map[? layer[j, k]];
                //Top
                if(block_get_property(prev_layer[j, k], "transparent", true)) {
                    var tex_x = tex_loc[0];
                    d3d_model_vertex_texture(model, j, k, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j, k+1, i+1, tex_x, 0);
                    d3d_model_vertex_texture(model, j, k+1, i+1, tex_x, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, tex_x, 1);
                }
                //Bottom
                if(is_undefined(next_layer) || block_get_property(next_layer[j, k], "transparent", true)) {
                    var tex_x = tex_loc[1];
                    d3d_model_vertex_texture(model, j, k, i, tex_x, 0);
                    d3d_model_vertex_texture(model, j, k+1, i, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j+1, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j, k+1, i, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i, tex_x+tex_inc, 1);
                }
                //X+
                if((j == 15 && block_get_property(layer_xp[0, k], "transparent", true)) || (j != 15 && block_get_property(layer[j+1, k], "transparent", true))) {
                    var tex_x = tex_loc[2];
                    d3d_model_vertex_texture(model, j+1, k, i, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j+1, k, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, tex_x, 0);
                }
                //Y+
                if((k == 15 && block_get_property(layer_yp[j, 0], "transparent", true)) || (k != 15 && block_get_property(layer[j, k+1], "transparent", true))) {
                    var tex_x = tex_loc[4];
                    d3d_model_vertex_texture(model, j+1, k+1, i, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j, k+1, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j, k+1, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j, k+1, i+1, tex_x, 0);
                }
                //X-
                if((j == 0 && block_get_property(layer_xn[15, k], "transparent", true)) || (j != 0 && block_get_property(layer[j-1, k], "transparent", true))) {
                    var tex_x = tex_loc[3];
                    d3d_model_vertex_texture(model, j, k+1, i, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j, k+1, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j, k+1, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j, k, i+1, tex_x, 0);
                }
                //Y-
                if((k == 0 && block_get_property(layer_yn[j, 15], "transparent", true)) || (k != 0 && block_get_property(layer[j, k-1], "transparent", true))) {
                    var tex_x = tex_loc[5];
                    d3d_model_vertex_texture(model, j, k, i, tex_x+tex_inc, 1);
                    d3d_model_vertex_texture(model, j+1, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j, k, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j, k, i+1, tex_x+tex_inc, 0);
                    d3d_model_vertex_texture(model, j+1, k, i, tex_x, 1);
                    d3d_model_vertex_texture(model, j+1, k, i+1, tex_x, 0);
                }
            }
        }
    }
    prev_layer = layer;
}
d3d_model_primitive_end(model);
return model;

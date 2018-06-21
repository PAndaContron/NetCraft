///chunk_model_create(world, coords)
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
            if(layer[j, k] == "grass") {
                //Top
                if(prev_layer[j, k] == "air") {
                    d3d_model_vertex_texture(model, j, k, i+1, 1, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j, k+1, i+1, 0, 0);
                    d3d_model_vertex_texture(model, j, k+1, i+1, 0, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, 0, 1);
                }
                //Bottom
                if(is_undefined(next_layer) || next_layer[j, k] == "air") {
                    d3d_model_vertex_texture(model, j, k, i, 0, 0);
                    d3d_model_vertex_texture(model, j, k+1, i, 1, 0);
                    d3d_model_vertex_texture(model, j+1, k, i, 0, 1);
                    d3d_model_vertex_texture(model, j+1, k, i, 0, 1);
                    d3d_model_vertex_texture(model, j, k+1, i, 1, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i, 1, 1);
                }
                //X+
                if((j == 15 && layer_xp[0, k] == "air") || (j != 15 && layer[j+1, k] == "air")) {
                    d3d_model_vertex_texture(model, j+1, k, i, 0, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i, 0, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j+1, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i, 0, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, 1, 0);
                }
                //Y+
                if((k == 15 && layer_yp[j, 0] == "air") || (k != 15 && layer[j, k+1] == "air")) {
                    d3d_model_vertex_texture(model, j+1, k+1, i, 0, 1);
                    d3d_model_vertex_texture(model, j, k+1, i, 0, 0);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j+1, k+1, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j, k+1, i, 0, 0);
                    d3d_model_vertex_texture(model, j, k+1, i+1, 1, 0);
                }
                //X-
                if((j == 0 && layer_xn[15, k] == "air") || (j != 0 && layer[j-1, k] == "air")) {
                    d3d_model_vertex_texture(model, j, k+1, i, 0, 1);
                    d3d_model_vertex_texture(model, j, k, i, 0, 0);
                    d3d_model_vertex_texture(model, j, k+1, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j, k+1, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j, k, i, 0, 0);
                    d3d_model_vertex_texture(model, j, k, i+1, 1, 0);
                }
                //Y-
                if((k == 0 && layer_yn[j, 15] == "air") || (k != 0 && layer[j, k-1] == "air")) {
                    d3d_model_vertex_texture(model, j, k, i, 0, 1);
                    d3d_model_vertex_texture(model, j+1, k, i, 0, 0);
                    d3d_model_vertex_texture(model, j, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j, k, i+1, 1, 1);
                    d3d_model_vertex_texture(model, j+1, k, i, 0, 0);
                    d3d_model_vertex_texture(model, j+1, k, i+1, 1, 0);
                }
            }
        }
    }
    prev_layer = layer;
}
d3d_model_primitive_end(model);
return model;

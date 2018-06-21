///chunk_draw(chunk_x, chunk_y, id)
var chunk_x = argument0;
var chunk_y = argument1;
var chunk = argument2;
var prev_layer = array_create_2d(16, 16, "air");
d3d_primitive_begin_texture(pr_trianglelist, grass_texture);
for(var i=255; i >= 0; i--) {
    var layer = ds_list_find_value(chunk, i);
    var next_layer = ds_list_find_value(chunk, i-1);
    for(var j=chunk_x*16; j < chunk_x*16+16; j++) {
        for(var k=chunk_y*16; k < chunk_y*16+16; k++) {
            var j_mod = j%16;
            if(j_mod < 0) j_mod += 16;
            var k_mod = k%16;
            if(k_mod < 0) k_mod += 16;
            if(layer[j_mod, k_mod] == "grass") {
                //Top
                if(prev_layer[j_mod, k_mod] == "air") {
                    d3d_vertex_texture(j, k, i+1, 1, 0);
                    d3d_vertex_texture(j+1, k, i+1, 1, 1);
                    d3d_vertex_texture(j, k+1, i+1, 0, 0);
                    d3d_vertex_texture(j, k+1, i+1, 0, 0);
                    d3d_vertex_texture(j+1, k, i+1, 1, 1);
                    d3d_vertex_texture(j+1, k+1, i+1, 0, 1);
                }
                //Bottom
                if(is_undefined(next_layer) || next_layer[j_mod, k_mod] == "air") {
                    d3d_vertex_texture(j, k, i, 0, 0);
                    d3d_vertex_texture(j, k+1, i, 1, 0);
                    d3d_vertex_texture(j+1, k, i, 0, 1);
                    d3d_vertex_texture(j+1, k, i, 0, 1);
                    d3d_vertex_texture(j, k+1, i, 1, 0);
                    d3d_vertex_texture(j+1, k+1, i, 1, 1);
                }
                //X+
                if(j == chunk_x*16+15 || layer[j_mod+1, k_mod] == "air") {
                    d3d_vertex_texture(j+1, k, i, 0, 1);
                    d3d_vertex_texture(j+1, k+1, i, 0, 0);
                    d3d_vertex_texture(j+1, k, i+1, 1, 1);
                    d3d_vertex_texture(j+1, k, i+1, 1, 1);
                    d3d_vertex_texture(j+1, k+1, i, 0, 0);
                    d3d_vertex_texture(j+1, k+1, i+1, 1, 0);
                }
                //Y+
                if(k == chunk_y*16+15 || layer[j_mod, k_mod+1] == "air") {
                    d3d_vertex_texture(j+1, k+1, i, 0, 1);
                    d3d_vertex_texture(j, k+1, i, 0, 0);
                    d3d_vertex_texture(j+1, k+1, i+1, 1, 1);
                    d3d_vertex_texture(j+1, k+1, i+1, 1, 1);
                    d3d_vertex_texture(j, k+1, i, 0, 0);
                    d3d_vertex_texture(j, k+1, i+1, 1, 0);
                }
                //X-
                if(j == chunk_x*16 || layer[j_mod-1, k_mod] == "air") {
                    d3d_vertex_texture(j, k+1, i, 0, 1);
                    d3d_vertex_texture(j, k, i, 0, 0);
                    d3d_vertex_texture(j, k+1, i+1, 1, 1);
                    d3d_vertex_texture(j, k+1, i+1, 1, 1);
                    d3d_vertex_texture(j, k, i, 0, 0);
                    d3d_vertex_texture(j, k, i+1, 1, 0);
                }
                //Y-
                if(k == chunk_y*16 || layer[j_mod, k_mod-1] == "air") {
                    d3d_vertex_texture(j, k, i, 0, 1);
                    d3d_vertex_texture(j+1, k, i, 0, 0);
                    d3d_vertex_texture(j, k, i+1, 1, 1);
                    d3d_vertex_texture(j, k, i+1, 1, 1);
                    d3d_vertex_texture(j+1, k, i, 0, 0);
                    d3d_vertex_texture(j+1, k, i+1, 1, 0);
                }
            }
        }
    }
    prev_layer = layer;
}
d3d_primitive_end();

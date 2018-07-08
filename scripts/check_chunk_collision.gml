///check_chunk_collision(chunk_x, chunk_y, vertices)
var coords = array_create(2);
coords[0] = argument0 * 16;
coords[1] = argument1 * 16;
var vertices = argument2;

for(var c=0; c < 2; c++) {
    var above = false, between = false, below = false;
    for(var i=0; i < array_height_2d(vertices); i++) {
        if(vertices[i, c] > coords[c]+16) {
            above = true;
        } else if(vertices[i, c] < coords[c]) {
            below = true;
        } else {
            between = true;
        }
    }
    if((above && !between && !below) || (!above && !between && below)) {
        return false;
    }
}

var edges = array_create_2d(4, 2, 0);

edges[0, 0] = (vertices[1, 0] - vertices[0, 0]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[1, 0], vertices[1, 1]);
edges[0, 1] = (vertices[1, 1] - vertices[0, 1]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[1, 0], vertices[1, 1]);

edges[1, 0] = (vertices[2, 0] - vertices[0, 0]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[2, 0], vertices[2, 1]);
edges[1, 1] = (vertices[2, 1] - vertices[0, 1]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[2, 0], vertices[2, 1]);

edges[2, 0] = (vertices[3, 0] - vertices[0, 0]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[3, 0], vertices[3, 1]);
edges[2, 1] = (vertices[3, 1] - vertices[0, 1]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[3, 0], vertices[3, 1]);

edges[3, 0] = (vertices[4, 0] - vertices[0, 0]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[4, 0], vertices[4, 1]);
edges[3, 1] = (vertices[4, 1] - vertices[0, 1]) / point_distance(vertices[0, 0], vertices[0, 1], vertices[4, 0], vertices[4, 1]);

for(var i = 0; i < 4; i++) {
    var proj = array_create(4);
    proj[0] = dot_product(chunk_x - vertices[0, 0], chunk_y - vertices[0, 1], edges[i, 0], edges[i, 1]);
    proj[1] = dot_product(chunk_x - vertices[0, 0] + 16, chunk_y - vertices[0, 1], edges[i, 0], edges[i, 1]);
    proj[2] = dot_product(chunk_x - vertices[0, 0], chunk_y - vertices[0, 1] + 16, edges[i, 0], edges[i, 1]);
    proj[3] = dot_product(chunk_x - vertices[0, 0] + 16, chunk_y - vertices[0, 1] + 16, edges[i, 0], edges[i, 1]);
    var above = false, between = false, below = false;
    for(var j = 0; j < 4; j++) {
        if(proj[j] > point_distance(vertices[0, 0], vertices[0, 1], vertices[i+1, 0], vertices[i+1, 1])) {
            above = true;
        } else if(proj[j] < 0) {
            below = true;
        } else {
            between = true;
        }
    }
    if((above && !between && !below) || (!above && !between && below)) {
        return false;
    }
}

return true;

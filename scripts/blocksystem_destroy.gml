///blocksystem_destroy()
var current = ds_map_find_first(global.block_map);
for(var i=0; i < ds_map_size(global.block_map); i++) {
    ds_map_destroy(global.block_map[? current]);
    current = ds_map_find_next(global.block_map, current);
}
ds_map_destroy(global.block_map);

///block_get_property(block, property, real)
var block = argument0;
var property = argument1;
var properties = global.block_map[? block];
if(is_undefined(properties)) {
    properties = ds_map_create();
    global.block_map[? block] = properties;
}
if(is_undefined(properties[? property])) {
    ini_open("Blocks.ini");
    if(argument2)   properties[? property] = ini_read_real(block, property, -1);
    else            properties[? property] = ini_read_string(block, property, "");
}
return properties[? property];

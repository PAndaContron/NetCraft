///block_get_property(block, property, real)
var block = argument0;
var property = argument1;
if(property == "model" && string_pos("#", argument0)) {
    return string_delete(argument0, 1, string_pos("#", argument0))+"_half";
} else if(string_pos("#", argument0)) {
    block = string_copy(argument0, 1, string_pos("#", argument0)-1);
}
var properties = global.block_map[? block];
if(is_undefined(properties)) {
    properties = ds_map_create();
    global.block_map[? block] = properties;
}
if(is_undefined(properties[? property])) {
    ini_open("Blocks.ini");
    if(argument2)   properties[? property] = ini_read_real(block, property, -1);
    else            properties[? property] = ini_read_string(block, property, "");
    ini_close();
}
return properties[? property];

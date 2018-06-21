///chunk_generate(chunk_x, chunk_y, id)
var chunk_x = argument0;
var chunk_y = argument1;
var tempArray = array_create_2d(16, 16, "grass");
ds_list_set(argument2, 0, tempArray);
tempArray = ds_list_find_value(argument2, 1);
tempArray[0, 0] = "grass";
ds_list_set(argument2, 1, tempArray);

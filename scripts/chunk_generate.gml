///chunk_generate(chunk_x, chunk_y, id)
var chunk_x = argument0;
var chunk_y = argument1;
var tempArray = array_create_2d(16, 16, "stone");
tempArray[15, 15] = "stone_slab#top";
argument2[| 0] = tempArray;
tempArray = array_create_2d(16, 16, "grass");
argument2[| 1] = tempArray;
tempArray = argument2[| 2];
tempArray[0, 0] = "grass";
tempArray[15, 15] = "stone_slab#bottom";
argument2[| 2] = tempArray;
argument2[| 5] = array_create_2d(16, 16, "stone_slab#bottom");

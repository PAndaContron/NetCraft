///chunk_create()
var chunk = ds_list_create();
for(var i=0; i < 256; i++) {
    var tempArray = array_create_2d(16, 16, "air");
    ds_list_add(chunk, tempArray);
}
return chunk;

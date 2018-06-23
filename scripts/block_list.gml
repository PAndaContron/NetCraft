///block_list()
var file = file_text_open_read("Blocks.ini");
var blocks = array_create(0);
var line = file_text_readln(file);
while(line != "") {
    if(string_char_at(line, 1) = "[") {
        var current_block = string_copy(line, 2, string_length(line)-2);
        if(block_get_property(current_block, "model", false) == "half") {
            blocks[array_length_1d(blocks)] = current_block+"#top";
            blocks[array_length_1d(blocks)] = current_block+"#bottom";
        } else {
            blocks[array_length_1d(blocks)] = current_block;
        }
    }
    line = file_text_readln(file);
}
return blocks;

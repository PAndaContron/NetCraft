///block_list()
var file = file_text_open_read("Blocks.ini");
var blocks = array_create(0);
var line = file_text_readln(file);
while(line != "") {
    if(string_char_at(line, 1) = "[") {
        blocks[array_length_1d(blocks)] = string_copy(line, 2, string_length(line)-2);
    }
    line = file_text_readln(file);
}
return blocks;

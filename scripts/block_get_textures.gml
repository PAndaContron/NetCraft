///block_get_textures(block)
//[top, bottom, X+, X-, Y+, Y-]
/* Possible keys:
 * texture
 * texture_topbottom
 * texture_top
 * texture_bottom
 * texture_sides
 * texture_x
 * texture_xp
 * texture_xn
 * texture_y
 * texture_yp
 * texture_yn
 */
var block = argument0;
if(string_pos("#", argument0)) {
    block = string_copy(argument0, 1, string_pos("#", argument0)-1);
}
var textures = array_create(6);
ini_open("Blocks.ini");
if(ini_key_exists(block, "texture")) {
    textures[0] = asset_get_index(ini_read_string(block, "texture", "none"));
    textures[1] = textures[0];
    textures[2] = textures[0];
    textures[3] = textures[0];
    textures[4] = textures[0];
    textures[5] = textures[0];
} else {
    if(ini_key_exists(block, "texture_topbottom")) {
        textures[0] = asset_get_index(ini_read_string(block, "texture_topbottom", "none"));
        textures[1] = textures[0];
    } else {
        textures[0] = asset_get_index(ini_read_string(block, "texture_top", "none"));
        textures[1] = asset_get_index(ini_read_string(block, "texture_bottom", "none"));
    }
    if(ini_key_exists(block, "texture_sides")) {
        textures[2] = asset_get_index(ini_read_string(block, "texture_sides", "none"));
        textures[3] = textures[2];
        textures[4] = textures[2];
        textures[5] = textures[2];
    } else {
        if(ini_key_exists(block, "texture_x")) {
            textures[2] = asset_get_index(ini_read_string(block, "texture_x", "none"));
            textures[3] = textures[2];
        } else {
            textures[2] = asset_get_index(ini_read_string(block, "texture_xp", "none"));
            textures[3] = asset_get_index(ini_read_string(block, "texture_xn", "none"));
        }
        if(ini_key_exists(block, "texture_y")) {
            textures[4] = asset_get_index(ini_read_string(block, "texture_y", "none"));
            textures[5] = textures[4];
        } else {
            textures[4] = asset_get_index(ini_read_string(block, "texture_yp", "none"));
            textures[5] = asset_get_index(ini_read_string(block, "texture_yn", "none"));
        }
    }
}
ini_close();
return textures;

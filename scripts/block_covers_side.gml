///block_covers_side(block, side)
if(block_get_property(argument0, "transparent", true)) {
    return false;
}
var side = argument1;
switch(block_get_property(argument0, "model", false)) {
    case "block": {
        return true;
    } break;
    case "top_half": {
        return side == 1;
    } break;
    case "bottom_half": {
        return side == 0;
    } break;
}

/*
Argument 0 : Elements Map
Argument 1 : Fog Information Map
*/

var indexX, indexY;
for(indexX = 0; indexX < MAP_WIDTH; indexX++){
    for(indexY = 0; indexY < MAP_HEIGHT; indexY++){
        selectedID = argument0[indexX,indexY];
        fogStatus = argument1[indexX,indexY];
        switch(fogStatus){
            case "NoVision":
                draw_sprite_ext(sprFogBlock,0,selectedID.x,selectedID.y,1,1,0,c_white,1);
                break;
        }
    }
}

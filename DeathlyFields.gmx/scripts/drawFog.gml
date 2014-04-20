/*
Argument 0 : Elements Map
Argument 1 : Fog Information Map
*/

var indexX, indexY;
for(indexX = 0; indexX < MAP_WIDTH; indexX++){
    for(indexY = 0; indexY < MAP_HEIGHT; indexY++){
        fogStatus = mapFog[indexX,indexY];
        if(fogStatus==0){
                draw_sprite_ext(sprFogBlock,0,MAP_INIT_POSITION_X+indexX*BLOCK_SIZE,MAP_INIT_POSITION_Y+indexY*BLOCK_SIZE,1,1,0,c_white,0.7);
        }
    }
}

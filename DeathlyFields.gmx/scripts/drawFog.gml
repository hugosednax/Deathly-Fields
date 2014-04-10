/*
Argument 0 : Elements Map
Argument 1 : Fog Information Map
*/

var initDepth;
initDepth = depth;
depth = -99999999;
var indexX, indexY;
for(indexX = 0; indexX < MAP_WIDTH; indexX++){
    for(indexY = 0; indexY < MAP_HEIGHT; indexY++){
        fogStatus = mapFog[indexX,indexY];
        switch(fogStatus){
            case 0:
                draw_sprite_ext(sprFogBlock,0,convertIndexToCoordinates(indexX,0),convertIndexToCoordinates(indexY,1),1,1,0,c_white,1);
                break;
        }
    }
}
depth = initDepth;

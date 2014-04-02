/*
Argument 0 : Elements Map
Argument 1 : Fog Information Map
Argument 2 : Map Width
Argument 3 : Map Height
*/

for(indexX = 0; indexX < argument2; indexX++){
    for(indexY = 0; indexY < argument3; indexY++){
        selectedID = argument0[indexX,indexY];
        fogStatus = argument1[indexX,indexY];
        switch(fogStatus){
            case "NoVision":
                draw_sprite_ext(sprFogBlock,0,selectedID.x,selectedID.y,1,1,0,c_white,0.5);
                break;
        }
    }
}

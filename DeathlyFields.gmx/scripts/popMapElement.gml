/*
arg0 : object name
*/
with(objMapManager){
    initIndexX = round(abs(argument0.x - MAP_INIT_POSITION_X)/BLOCK_SIZE);
    initIndexY = round(abs(argument0.y - MAP_INIT_POSITION_Y)/BLOCK_SIZE);
    width = objID.sprite_width/32;
    height = objID.sprite_height/32;
    var k,l;
    for(k=initIndexX;k<initIndexX+width && k<MAP_WIDTH;k++){
        for(l=initIndexY;l<initIndexY+height && l<MAP_HEIGHT;l++){
            mapContents[k,l] = 0;
        }
    }
    var sight = objID.sight;
    for(k=initIndexX-sight;k<initIndexX+width+sight && k<MAP_WIDTH;k++){
        for(l=initIndexY-sight;l<initIndexY+height+sight && l<MAP_HEIGHT;l++){
            mapFog[k,l] -= 1;
        }
    }
    with(argument0){
        instance_destroy();
    }
}

/*
arg0 : object name
arg1 : new position x
arg2 : new position y
*/
with(objMapManager){
    initIndexX = round(abs(argument0.x - MAP_INIT_POSITION_X)/BLOCK_SIZE);
    initIndexY = round(abs(argument0.y - MAP_INIT_POSITION_Y)/BLOCK_SIZE);
    
    newIndexX = round(abs(argument1 - MAP_INIT_POSITION_X)/BLOCK_SIZE);
    newIndexY = round(abs(argument2 - MAP_INIT_POSITION_Y)/BLOCK_SIZE);
    
    width = objID.sprite_width/32;
    height = objID.sprite_height/32;
    
    var k,l;
    for(k=initIndexX;k<initIndexX+width && k<MAP_WIDTH;k++){
        for(l=initIndexY;l<initIndexY+height && l<MAP_HEIGHT;l++){
            mapContents[k,l] = 0;
        }
    }
    
    for(k=newIndexX;k<newIndexX+width && k<MAP_WIDTH;k++){
        for(l=newIndexY;l<newIndexY+height && l<MAP_HEIGHT;l++){
            mapContents[k,l] = argument0;
        }
    }
    
    var sight = objID.sight;
    for(k=initIndexX-sight;k<initIndexX+width+sight && k<MAP_WIDTH;k++){
        for(l=initIndexY-sight;l<initIndexY+height+sight && l<MAP_HEIGHT;l++){
            mapFog[k,l] -= 1;
        }
    }
    
    for(k=newIndexX-sight;k<newIndexX+width+sight && k<MAP_WIDTH;k++){
        for(l=newIndexY-sight;l<newIndexY+height+sight && l<MAP_HEIGHT;l++){
            mapFog[k,l] += 1;
        }
    }
    
    argument0.x = argument1;
    argument0.y = argument2;
}

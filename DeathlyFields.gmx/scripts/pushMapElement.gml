/*
arg0 : object name
arg1 : position x
arg2 : position y
*/
with(objMapManager){
    initIndexX = round(abs(argument1 - MAP_INIT_POSITION_X)/BLOCK_SIZE);
    initIndexY = round(abs(argument2 - MAP_INIT_POSITION_Y)/BLOCK_SIZE);
    objID = instance_create(MAP_INIT_POSITION_X + initIndexX*BLOCK_SIZE,
                            MAP_INIT_POSITION_Y + initIndexY*BLOCK_SIZE,
                            argument0);
    width  = objID.sprite_width /32;
    height = objID.sprite_height/32;
    var k,l;
    for(k=initIndexX;k<initIndexX+width && k<MAP_WIDTH;k++){
        for(l=initIndexY;l<initIndexY+height && l<MAP_HEIGHT;l++){
            mapContents[k,l] = objID;
        }
    }
    var sight = objID.sight;
    for(k=initIndexX-sight;k<initIndexX+width+sight && k<MAP_WIDTH;k++){
        for(l=initIndexY-sight;l<initIndexY+height+sight && l<MAP_HEIGHT;l++){
            mapFog[k,l] += 1;
        }
    }
    
    objID.mapPositionX = initIndexX;
    objID.mapPositionY = initIndexY;        
}

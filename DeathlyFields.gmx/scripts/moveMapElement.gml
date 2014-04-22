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
    var ky;
 
        
    for(k=max(0,initIndexX-sight);k<MAP_WIDTH && k<=min(MAP_WIDTH-1,initIndexX+sight);k++){
        dif = floor(sqrt(sqr(sight)-sqr(k-initIndexX)));
        l=min(MAP_HEIGHT-1,initIndexY + dif);
        mapFog[k,l] --;
        if(dif!=0){
            l=max(0,initIndexY - dif);
            mapFog[k,l] --;
        }
        for(ky=max(0,initIndexY - dif + 1);ky<=min(MAP_HEIGHT-1,initIndexY+dif-1);ky++){
            mapFog[k,ky]--;
        }
    }
    
     for(k=max(0,newIndexX-sight);k<MAP_WIDTH && k<=min(MAP_WIDTH-1,newIndexX+sight);k++){
            dif = floor(sqrt(sqr(sight)-sqr(k-newIndexX)));
            l=min(MAP_HEIGHT-1,newIndexY + dif);
            mapFog[k,l] ++;
            if(dif!=0){
                l=max(0,newIndexY - dif);
                mapFog[k,l] ++;
            }
            for(ky=max(0,newIndexY - dif + 1);ky<=min(MAP_HEIGHT-1,newIndexY+dif-1);ky++){
                mapFog[k,ky]++;
            }
        }
    
    argument0.x = argument1;
    argument0.y = argument2;
}

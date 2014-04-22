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
    var s,a,ky;
    
    // meu, almost
    
    for(k=max(0,initIndexX-sight);k<MAP_WIDTH && k<=min(MAP_WIDTH-1,initIndexX+sight);k++){
        dif = floor(sqrt(sqr(sight)-sqr(k-initIndexX)));
        l=min(MAP_HEIGHT-1,initIndexY + dif);
        mapFog[k,l] ++;
        if(dif!=0){
            l=max(0,initIndexY - dif);
            mapFog[k,l] ++;
        }
        for(ky=max(0,initIndexY - dif + 1);ky<=min(MAP_HEIGHT-1,initIndexY+dif-1);ky++){
            mapFog[k,ky]++;
        }
    }

    
    //internet so com valores grandes tipo 10 é que é bonito
    /*
    for(s=1;s<sight;s++){
        for(a=0;a<=2*pi;a+=(pi/power(s,2))){
            k = initIndexX + s *cos(a);
            l= initIndexY + s *sin(a);
            mapFog[k,l] += 1;
            }
    }*/
    

    objID.mapPositionX = initIndexX;
    objID.mapPositionY = initIndexY;        
}

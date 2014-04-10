var i,j;
for(i=0;i<MAP_WIDTH;i++)
for(j=0;j<MAP_HEIGHT;j++)
if(mapFog[i,j]!=0)
return false;
return true;


ToRemove = argument0;

for(i=0;i<objIngameDeck.ingameSize;i++){
    if ToRemove!=i{
    objIngameDeck.ChosenDeckIngame[i]=objIngameDeck.ChosenDeckIngame[i];
    }else {
    objIngameDeck.ChosenDeckIngame[i]=objIngameDeck.ChosenDeckIngame[i++];
    i--;
    }
}

objIngameDeck.ingameSize--;

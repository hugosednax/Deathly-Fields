var temp, randomIndex, size;
size = argument0;

for (i = 1; i < size; i += 1)
{
    randomIndex = irandom_range( 0, i );
    temp = objIngameDeck.ChosenDeckIngame[i];
    objIngameDeck.ChosenDeckIngame[i] = objIngameDeck.ChosenDeckIngame[randomIndex];
    objIngameDeck.ChosenDeckIngame[randomIndex] = temp;    
}

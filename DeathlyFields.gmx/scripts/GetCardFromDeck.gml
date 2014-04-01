cardFromDeck=0;
while(objHand.nCardsHand<MAX_CARD_HAND && objIngameDeck.ingameSize!=0){
objHand.CardInHand[objHand.nCardsHand]=instance_create(20,10+objHand.nCardsHand*(150),objIngameDeck.ChosenDeckIngame[cardFromDeck]);
objHand.nCardsHand++;
RemoveCardFromDeck(cardFromDeck);
cardFromDeck++;
}

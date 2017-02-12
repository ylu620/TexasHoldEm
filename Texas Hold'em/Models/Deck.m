//
//  Deck.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@implementation Deck

- (instancetype)init {
  self = [super init];
  if (self) {
    NSMutableArray *cards = [NSMutableArray arrayWithCapacity:52];
    for (CardRank rank = CardRankTwo; rank <= CardRankAce; rank++) {
      for (CardSuit suit = CardSuitClubs; suit <= CardSuitSpades; suit++) {
        [cards addObject:[[Card alloc] initWithRank:rank andSuit:suit]];
      }
    }
    self.cards = cards;
  }
  return self;
}

- (BOOL)isEmpty {
  return self.cards.count == 0;
}

- (void)shuffle {
  NSUInteger count = [self.cards count];
  for (NSUInteger i = 0; i < count; ++i) {
    // Select a random element between i and end of array to swap with.
    NSUInteger nElements = count - i;
    NSInteger n = arc4random_uniform(nElements) + i;
    [self.cards exchangeObjectAtIndex:i withObjectAtIndex:n];
  }
}

- (Card *)drawCard {
  Card *card = [self.cards firstObject];
  [self.cards removeObjectAtIndex:0];
  return card;
}

@end

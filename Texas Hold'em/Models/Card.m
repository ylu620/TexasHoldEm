//
//  Card.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)init {
  return [self initWithRank:CardRankTwo andSuit:CardSuitClubs];
}

- (instancetype)initWithRank:(CardRank)rank
                     andSuit:(CardSuit)suit
{
  self = [super init];
  if (self) {
    self.rank = rank;
    self.suit = suit;
  }
  return self;
}

- (NSComparisonResult)compare:(Card *)other {
  return [@(self.rank) compare:@(other.rank)];
}

+ (NSString *)rankToString:(CardRank)rank {
  switch (rank) {
    case CardRankTwo: return @"Two";
    case CardRankThree: return @"Three";
    case CardRankFour: return @"Four";
    case CardRankFive: return @"Five";
    case CardRankSix: return @"Six";
    case CardRankSeven: return @"Seven";
    case CardRankEight: return @"Eight";
    case CardRankNine: return @"Nine";
    case CardRankTen: return @"Ten";
    case CardRankJack: return @"Jack";
    case CardRankQueen: return @"Queen";
    case CardRankKing: return @"King";
    case CardRankAce: return @"Ace";
  }
}

+ (NSString *)suitToString:(CardSuit)suit {
  switch (suit) {
    case CardSuitClubs: return @"Clubs";
    case CardSuitDiamonds: return @"Diamonds";
    case CardSuitHearts: return @"Hearts";
    case CardSuitSpades: return @"Spades";
  }
}

- (BOOL)isEqual:(id)object {
  if (![object isKindOfClass:[Card class]]) {
    return NO;
  }
  Card *other = (Card *)object;
  return self.rank == other.rank && self.suit == other.suit;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@ of %@",
          [[self class] rankToString:self.rank], [[self class] suitToString:self.suit]];
}

@end

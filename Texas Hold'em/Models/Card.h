//
//  Card.h
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CardRank)
{
  CardRankTwo = 2,
  CardRankThree = 3,
  CardRankFour = 4,
  CardRankFive = 5,
  CardRankSix = 6,
  CardRankSeven = 7,
  CardRankEight = 8,
  CardRankNine = 9,
  CardRankTen = 10,
  CardRankJack = 11,
  CardRankQueen = 12,
  CardRankKing = 13,
  CardRankAce = 14
};

typedef NS_ENUM(NSInteger, CardSuit)
{
  CardSuitClubs,
  CardSuitDiamonds,
  CardSuitHearts,
  CardSuitSpades
};

@interface Card : NSObject

@property (nonatomic, assign) CardRank rank;
@property (nonatomic, assign) CardSuit suit;

- (instancetype)initWithRank:(CardRank)rank
                     andSuit:(CardSuit)suit;

+ (NSString *)rankToString:(CardRank)rank;

- (NSComparisonResult)compare:(Card *)other;

@end

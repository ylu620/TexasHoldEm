//
//  TexasHoldemPlayerTests.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/12/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TexasHoldemPlayer.h"
#import "PokerHand.h"
#import "Card.h"

@interface TexasHoldemPlayerTests : XCTestCase
@property (nonatomic, strong) TexasHoldemPlayer *player;
@property (nonatomic, strong) PokerHand *straightFlushQueenHigh;
@end

@implementation TexasHoldemPlayerTests

- (void)setUp {
  [super setUp];
  self.player = [[TexasHoldemPlayer alloc] init];
  self.straightFlushQueenHigh = [[PokerHand alloc] initWithCards:
                                 @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
}

- (void)testInit {
  XCTAssertEqual(self.player.privateHand.cards.count, 0);

  TexasHoldemPlayer *jack = [[TexasHoldemPlayer alloc] initWithName:@"Jack"];
  XCTAssertTrue([[jack description] rangeOfString:@"Jack"].location == 0);
}

- (void)testBestHand {
  self.player.privateHand = [[Hand alloc] initWithCards:
                             @[[[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                               [[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs]]];
  Hand *board = [[Hand alloc] initWithCards:
                 @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitDiamonds],
                   [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                   [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                   [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds],
                   [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  PokerHand *sortedHand = [self.player bestHandWithBoardCards:board.cards];
  [sortedHand.cards sortUsingSelector:@selector(compare:)];
  XCTAssertEqualObjects(sortedHand, self.straightFlushQueenHigh);
}

- (void)testBestHandWithAllBoard {
  self.player.privateHand = [[Hand alloc] initWithCards:
                             @[[[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitClubs],
                               [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitDiamonds]]];
  Hand *board = self.straightFlushQueenHigh;
  PokerHand *sortedHand = [self.player bestHandWithBoardCards:board.cards];
  [sortedHand.cards sortUsingSelector:@selector(compare:)];
  XCTAssertEqualObjects(sortedHand, self.straightFlushQueenHigh);
}

@end

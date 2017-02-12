//
//  PokerHandTests.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/12/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "PokerHand.h"
#import "Card.h"

@interface PokerHandTests : XCTestCase
@property (nonatomic, strong) PokerHand *straightFlushQueenHigh;
@property (nonatomic, strong) PokerHand *fourJacksAndAQueen;
@property (nonatomic, strong) PokerHand *fullHouseKingsAndSixes;
@property (nonatomic, strong) PokerHand *flushKingHigh;
@property (nonatomic, strong) PokerHand *straightQueenHigh;
@property (nonatomic, strong) PokerHand *threeFours;
@property (nonatomic, strong) PokerHand *twoFoursTwoJacks;
@property (nonatomic, strong) PokerHand *onePairOfKings;
@property (nonatomic, strong) PokerHand *jackHigh;
@property (nonatomic, strong) PokerHand *sevenHigh;
@end

@implementation PokerHandTests

- (void)setUp {
  [super setUp];
  self.straightFlushQueenHigh = [[PokerHand alloc] initWithCards:
                                 @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  self.fourJacksAndAQueen = [[PokerHand alloc] initWithCards:
                             @[[[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                               [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds],
                               [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitHearts],
                               [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitSpades],
                               [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  self.fullHouseKingsAndSixes = [[PokerHand alloc] initWithCards:
                                 @[[[Card alloc] initWithRank:CardRankKing andSuit:CardSuitHearts],
                                   [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitSpades],
                                   [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitDiamonds]]];
  self.flushKingHigh = [[PokerHand alloc] initWithCards:
                        @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs],
                          [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                          [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                          [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                          [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  self.straightQueenHigh = [[PokerHand alloc] initWithCards:
                            @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitDiamonds],
                              [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                              [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                              [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                              [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  self.threeFours = [[PokerHand alloc] initWithCards:
                     @[[[Card alloc] initWithRank:CardRankFour andSuit:CardSuitHearts],
                       [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitSpades],
                       [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitClubs],
                       [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitClubs],
                       [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitDiamonds]]];
  self.twoFoursTwoJacks = [[PokerHand alloc] initWithCards:
                           @[[[Card alloc] initWithRank:CardRankFour andSuit:CardSuitHearts],
                             [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitSpades],
                             [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                             [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                             [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds]]];
  self.onePairOfKings = [[PokerHand alloc] initWithCards:
                         @[[[Card alloc] initWithRank:CardRankKing andSuit:CardSuitHearts],
                           [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitSpades],
                           [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitClubs],
                           [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                           [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitDiamonds]]];
  self.jackHigh = [[PokerHand alloc] initWithCards:
                   @[[[Card alloc] initWithRank:CardRankFour andSuit:CardSuitHearts],
                     [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitSpades],
                     [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitClubs],
                     [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                     [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitDiamonds]]];
  self.sevenHigh = [[PokerHand alloc] initWithCards:
                    @[[[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitHearts],
                      [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitSpades],
                      [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitClubs],
                      [[Card alloc] initWithRank:CardRankFive andSuit:CardSuitClubs],
                      [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitDiamonds]]];
}

- (void)testHandType {
  XCTAssertEqual(self.straightFlushQueenHigh.handType, PokerHandTypeStraightFlush);
  XCTAssertEqual(self.fourJacksAndAQueen.handType, PokerHandTypeFourOfAKind);
  XCTAssertEqual(self.fullHouseKingsAndSixes.handType, PokerHandTypeFullHouse);
  XCTAssertEqual(self.flushKingHigh.handType, PokerHandTypeFlush);
  XCTAssertEqual(self.straightQueenHigh.handType, PokerHandTypeStraight);
  XCTAssertEqual(self.threeFours.handType, PokerHandTypeThreeOfAKind);
  XCTAssertEqual(self.twoFoursTwoJacks.handType, PokerHandTypeTwoPair);
  XCTAssertEqual(self.onePairOfKings.handType, PokerHandTypeOnePair);
  XCTAssertEqual(self.jackHigh.handType, PokerHandTypeHighCard);
  XCTAssertEqual(self.sevenHigh.handType, PokerHandTypeHighCard);
}

- (void)testSimpleComparisons {
  XCTAssertEqual([self.straightFlushQueenHigh compare:self.fourJacksAndAQueen], NSOrderedDescending);
  XCTAssertEqual([self.fourJacksAndAQueen compare:self.fullHouseKingsAndSixes], NSOrderedDescending);
  XCTAssertEqual([self.fullHouseKingsAndSixes compare:self.flushKingHigh], NSOrderedDescending);
  XCTAssertEqual([self.flushKingHigh compare:self.straightQueenHigh], NSOrderedDescending);
  XCTAssertEqual([self.straightQueenHigh compare:self.threeFours], NSOrderedDescending);
  XCTAssertEqual([self.threeFours compare:self.twoFoursTwoJacks], NSOrderedDescending);
  XCTAssertEqual([self.twoFoursTwoJacks compare:self.onePairOfKings], NSOrderedDescending);
  XCTAssertEqual([self.onePairOfKings compare:self.jackHigh], NSOrderedDescending);
  XCTAssertEqual([self.jackHigh compare:self.sevenHigh], NSOrderedDescending);
}

- (void)testStraightComparisons {
  PokerHand *straightFlushKingHigh = [[PokerHand alloc] initWithCards:
                                      @[[[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  XCTAssertEqual([straightFlushKingHigh compare:self.straightFlushQueenHigh], NSOrderedDescending);


  PokerHand *straightKingHigh = [[PokerHand alloc] initWithCards:
                                 @[[[Card alloc] initWithRank:CardRankKing andSuit:CardSuitDiamonds],
                                   [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                   [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  XCTAssertEqual([straightKingHigh compare:self.straightQueenHigh], NSOrderedDescending);
}

- (void)testFlushComparisons {
  PokerHand *flushQueenHigh = [[PokerHand alloc] initWithCards:
                               @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs],
                                 [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                 [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitClubs],
                                 [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                 [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs]]];
  PokerHand *flushKingHighThenJack = [[PokerHand alloc] initWithCards:
                                      @[[[Card alloc] initWithRank:CardRankEight andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                        [[Card alloc] initWithRank:CardRankTen andSuit:CardSuitClubs]]];
  XCTAssertEqual([flushQueenHigh compare:self.flushKingHigh], NSOrderedAscending);
  XCTAssertEqual([flushKingHighThenJack compare:self.flushKingHigh], NSOrderedAscending);
  XCTAssertEqual([flushQueenHigh compare:flushKingHighThenJack], NSOrderedAscending);
}

- (void)testXOfAKindComparisons {
  PokerHand *threeSevensNineHigh = [[PokerHand alloc] initWithCards:
                                    @[[[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitHearts],
                                      [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitSpades],
                                      [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitClubs],
                                      [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitClubs],
                                      [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitDiamonds]]];
  PokerHand *threeSevensEightHigh = [[PokerHand alloc] initWithCards:
                                     @[[[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitHearts],
                                       [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitSpades],
                                       [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankSix andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankEight andSuit:CardSuitDiamonds]]];
  XCTAssertEqual([threeSevensNineHigh compare:self.threeFours], NSOrderedDescending);
  XCTAssertEqual([threeSevensNineHigh compare:threeSevensEightHigh], NSOrderedDescending);
  XCTAssertEqual([self.threeFours compare:threeSevensEightHigh], NSOrderedAscending);

  PokerHand *fullHouseJacksAndAces = [[PokerHand alloc] initWithCards:
                                    @[[[Card alloc] initWithRank:CardRankJack andSuit:CardSuitHearts],
                                      [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitSpades],
                                      [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                      [[Card alloc] initWithRank:CardRankAce andSuit:CardSuitClubs],
                                      [[Card alloc] initWithRank:CardRankAce andSuit:CardSuitDiamonds]]];
  PokerHand *fullHouseKingsAndNines = [[PokerHand alloc] initWithCards:
                                     @[[[Card alloc] initWithRank:CardRankKing andSuit:CardSuitHearts],
                                       [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitSpades],
                                       [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankNine andSuit:CardSuitDiamonds]]];
  XCTAssertEqual([fullHouseKingsAndNines compare:fullHouseJacksAndAces], NSOrderedDescending);
  XCTAssertEqual([fullHouseKingsAndNines compare:self.fullHouseKingsAndSixes], NSOrderedDescending);
  XCTAssertEqual([self.fullHouseKingsAndSixes compare:fullHouseJacksAndAces], NSOrderedDescending);

  XCTAssertEqual([self.threeFours compare:threeSevensEightHigh], NSOrderedAscending);

  PokerHand *twoTwosTwoThrees = [[PokerHand alloc] initWithCards:
                                 @[[[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitHearts],
                                   [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitSpades],
                                   [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitHearts],
                                   [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitSpades],
                                   [[Card alloc] initWithRank:CardRankAce andSuit:CardSuitDiamonds]]];
  PokerHand *twoKingsTwoQueens = [[PokerHand alloc] initWithCards:
                                  @[[[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitHearts],
                                    [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitSpades],
                                    [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitHearts],
                                    [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitSpades],
                                    [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitDiamonds]]];
  XCTAssertEqual([twoKingsTwoQueens compare:twoTwosTwoThrees], NSOrderedDescending);
  XCTAssertEqual([twoKingsTwoQueens compare:self.twoFoursTwoJacks], NSOrderedDescending);
  XCTAssertEqual([self.twoFoursTwoJacks compare:twoTwosTwoThrees], NSOrderedDescending);
}

- (void)testTrueTieComparisons {
  PokerHand *twoFoursTwoJacksAgain = [[PokerHand alloc] initWithCards:
                                     @[[[Card alloc] initWithRank:CardRankFour andSuit:CardSuitHearts],
                                       [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitSpades],
                                       [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs],
                                       [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds]]];
  XCTAssertEqual([twoFoursTwoJacksAgain compare:self.twoFoursTwoJacks], NSOrderedSame);
}

@end

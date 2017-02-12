//
//  HandTests.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Deck.h"
#import "Hand.h"
#import "Card.h"

@interface HandTests : XCTestCase
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) Hand *hand;

@property (nonatomic, strong) Card *queenOfClubs;
@property (nonatomic, strong) Card *threeOfSpades;
@property (nonatomic, strong) Card *jackOfDiamonds;
@property (nonatomic, strong) Card *sevenOfHearts;
@end

@implementation HandTests

- (void)setUp {
  [super setUp];
  self.deck = [[Deck alloc] init];
  self.hand = [[Hand alloc] init];
  self.queenOfClubs = [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs];
  self.threeOfSpades = [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitSpades];
  self.jackOfDiamonds = [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds];
  self.sevenOfHearts = [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitHearts];
}

- (void)testInitialize {
  XCTAssertEqualObjects(self.hand.cards, @[]);

  NSArray *params = @[self.queenOfClubs, self.threeOfSpades];
  Hand *hand = [[Hand alloc] initWithCards:params];
  XCTAssertEqual(hand.cards.count, 2);
  for (Card *card in params) {
    XCTAssertTrue([hand.cards containsObject:card]);
  }

  params = @[self.queenOfClubs, self.jackOfDiamonds, self.sevenOfHearts, self.threeOfSpades];
  hand = [[Hand alloc] initWithCards:params];
  XCTAssertEqual(hand.cards.count, 4);
  for (Card *card in params) {
    XCTAssertTrue([hand.cards containsObject:card]);
  }
}

- (void)testNormalDraw {
  [self.hand drawCards:2 fromDeck:self.deck];
  XCTAssertEqual(self.hand.cards.count, 2);
  // first two cards in a new, un-shuffled deck are the two of clubs and two of diamonds
  Card *twoOfClubs = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitClubs];
  Card *twoOfDiamonds = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitDiamonds];
  for (Card *card in @[twoOfClubs, twoOfDiamonds]) {
    XCTAssertTrue([self.hand.cards containsObject:card]);
  }

  [self.hand drawCards:2 fromDeck:self.deck];
  XCTAssertEqual(self.hand.cards.count, 4);
  // next two cards are the other two twos
  Card *twoOfHearts = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitHearts];
  Card *twoOfSpades = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitSpades];
  for (Card *card in @[twoOfClubs, twoOfDiamonds, twoOfHearts, twoOfSpades]) {
    XCTAssertTrue([self.hand.cards containsObject:card]);
  }
}

- (void)testLowCardDraw {
  Hand *bunkHand = [[Hand alloc] init];
  [bunkHand drawCards:50 fromDeck:self.deck];

  // only 52 cards in a deck, so we only draw two cards even though we asked for four
  NSUInteger numDrawn = [self.hand drawCards:4 fromDeck:self.deck];
  XCTAssertEqual(numDrawn, 2);
  XCTAssertEqual(self.hand.cards.count, 2);

  // and then we draw nothing
  numDrawn = [self.hand drawCards:4 fromDeck:self.deck];
  XCTAssertEqual(numDrawn, 0);
  XCTAssertEqual(self.hand.cards.count, 2);
}

@end

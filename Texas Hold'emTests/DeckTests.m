//
//  DeckTests.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Deck.h"
#import "Card.h"

@interface DeckTests : XCTestCase
@property (nonatomic, strong) Deck *deck;
@end

@implementation DeckTests

- (void)setUp {
  [super setUp];
  self.deck = [[Deck alloc] init];
}

- (void)testInit {
  XCTAssertEqual(self.deck.cards.count, 52);
  XCTAssertTrue([self.deck.cards[0] isKindOfClass:[Card class]]);

  NSMutableSet *suits = [NSMutableSet setWithCapacity:4];
  for (Card *card in self.deck.cards) {
    [suits addObject:@(card.suit)];
  }
  XCTAssertEqual(suits.count, 4);
  for (NSNumber *suitWrapped in @[@(CardSuitClubs), @(CardSuitDiamonds), @(CardSuitHearts), @(CardSuitSpades)]) {
    XCTAssertTrue([suits containsObject:suitWrapped]);
  }


  NSMutableSet *ranks = [NSMutableSet setWithCapacity:13];
  for (Card *card in self.deck.cards) {
    [ranks addObject:@(card.rank)];
  }
  XCTAssertEqual(ranks.count, 13);
  NSArray *rankEnumsWrapped =
  @[@(CardRankTwo), @(CardRankThree), @(CardRankFour), @(CardRankFive),
    @(CardRankSix), @(CardRankSeven), @(CardRankEight), @(CardRankNine),
    @(CardRankTen), @(CardRankJack), @(CardRankQueen), @(CardRankKing),
    @(CardRankAce)];
  for (NSNumber *rankWrapped in rankEnumsWrapped) {
    XCTAssertTrue([ranks containsObject:rankWrapped]);
  }
}

- (void)testShuffle {
  NSArray *cards = [self.deck.cards copy];
  [self.deck shuffle];
  NSArray *shuffledCards = [self.deck.cards copy];
  XCTAssertNotEqualObjects(cards, shuffledCards);
}

- (void)testDraw {
  Card *firstCard = [self.deck.cards firstObject];
  NSMutableArray *expectedDeck = [self.deck.cards mutableCopy];
  [expectedDeck removeObjectAtIndex:0];
  XCTAssertEqualObjects([self.deck drawCard], firstCard);
  XCTAssertEqualObjects(self.deck.cards, expectedDeck);
}

@end

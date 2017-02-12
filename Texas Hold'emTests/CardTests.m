//
//  Texas_Hold_emTests.m
//  Texas Hold'emTests
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Card.h"

@interface CardTests : XCTestCase

@end

@implementation CardTests

- (void)testInit {
  Card *card = [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs];
  XCTAssertEqual(card.rank, CardRankQueen);
  XCTAssertEqual(card.suit, CardSuitClubs);

  card = [[Card alloc] initWithRank:CardRankThree andSuit:CardSuitSpades];
  XCTAssertEqual(card.rank, CardRankThree);
  XCTAssertEqual(card.suit, CardSuitSpades);

  card = [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitDiamonds];
  XCTAssertEqual(card.rank, CardRankJack);
  XCTAssertEqual(card.suit, CardSuitDiamonds);

  card = [[Card alloc] initWithRank:CardRankSeven andSuit:CardSuitHearts];
  XCTAssertEqual(card.rank, CardRankSeven);
  XCTAssertEqual(card.suit, CardSuitHearts);
}

- (void)testCompare {
  Card *kingOfClubs = [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs];
  Card *queenOfClubs = [[Card alloc] initWithRank:CardRankQueen andSuit:CardSuitClubs];
  Card *jackOfClubs = [[Card alloc] initWithRank:CardRankJack andSuit:CardSuitClubs];
  Card *aceOfClubs = [[Card alloc] initWithRank:CardRankAce andSuit:CardSuitClubs];
  Card *twoOfDiamonds = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitDiamonds];
  Card *twoOfHearts = [[Card alloc] initWithRank:CardRankTwo andSuit:CardSuitHearts];
  Card *fourOfSpades = [[Card alloc] initWithRank:CardRankFour andSuit:CardSuitSpades];

  XCTAssertEqual([kingOfClubs compare:queenOfClubs], NSOrderedDescending);
  XCTAssertEqual([kingOfClubs compare:jackOfClubs], NSOrderedDescending);
  XCTAssertEqual([kingOfClubs compare:kingOfClubs], NSOrderedSame);
  XCTAssertEqual([kingOfClubs compare:aceOfClubs], NSOrderedAscending);

  XCTAssertEqual([jackOfClubs compare:queenOfClubs], NSOrderedAscending);
  XCTAssertEqual([jackOfClubs compare:fourOfSpades], NSOrderedDescending);

  XCTAssertEqual([aceOfClubs compare:queenOfClubs], NSOrderedDescending);
  XCTAssertEqual([aceOfClubs compare:twoOfHearts], NSOrderedDescending);

  XCTAssertEqual([twoOfHearts compare:fourOfSpades], NSOrderedAscending);
  XCTAssertEqual([twoOfHearts compare:twoOfDiamonds], NSOrderedSame);

  XCTAssertEqualObjects(kingOfClubs, [[Card alloc] initWithRank:CardRankKing andSuit:CardSuitClubs]);
}

@end

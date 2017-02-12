//
//  TexasHoldemPlayer.m
//  Texas Hold'em
//
//  Created by David Kettler on 6/11/15.
//  Copyright (c) 2015 Patreon. All rights reserved.
//

#import "TexasHoldemPlayer.h"

#import "Hand.h"
#import "PokerHand.h"

@interface TexasHoldemPlayer ()
@property (nonatomic, strong) NSString *playerName;

@end

@implementation TexasHoldemPlayer

- (instancetype)init {
    return [self initWithName:nil];
}

- (instancetype)initWithName:(NSString *)name {
    if (name != nil) {
        self.playerName = name;
    }
    else {
        self.playerName = @"player";
    }
    self.privateHand = [Hand new];
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",
            self.playerName];
}

- (PokerHand *)bestHandWithBoardCards:(NSArray *)cards {
    NSMutableArray *totalCards = [[NSMutableArray alloc] initWithArray:self.privateHand.cards];
    [totalCards addObjectsFromArray:cards];
    
    
    NSMutableArray *set = [[NSMutableArray alloc] initWithArray:cards];
    [set addObjectsFromArray:self.privateHand.cards];
    NSLog(@"set :%@", [set description]);
    
    // 5 loops for implement 7 chooose 5. Not an efficent way to do this
    // but given only 21 combinations in this case it works fine
    NSMutableArray *combinations = [[NSMutableArray alloc] init];
    NSArray *bestCards = [NSArray new];
    PokerHandType bestType=-1;
    for (NSInteger i=0; i<[set count]; i++) {
        for(NSInteger j=i+1; j<[set count]; j++){
            for(NSInteger k=j+1; k<[set count]; k++){
                for(NSInteger l=k+1; l<[set count]; l++){
                    for(NSInteger o=l+1; o<[set count]; o++){
            
                        NSArray *newCombination = [[NSArray alloc] initWithObjects:
                                                   [set objectAtIndex:i],
                                                   [set objectAtIndex:j],
                                                   [set objectAtIndex:k],
                                                   [set objectAtIndex:l],
                                                   [set objectAtIndex:o],
                                                   nil];
                        PokerHand *hand = [[PokerHand alloc] initWithCards:newCombination];
                        if (hand.handType>bestType) {
                            bestType = hand.handType;
                            bestCards = newCombination;
                        }
                        [combinations addObject:newCombination];
                    }
                }
            }
        }
    }
    NSLog(@"combination count: %i", combinations.count);
    NSLog(@"best type and best hand: %i, %@", bestType, [bestCards description]);
    
    PokerHand *hand = [[PokerHand alloc] initWithCards:bestCards];
    return hand;
}

@end

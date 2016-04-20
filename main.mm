//
//  main.m
//  TestNSString
//
//  Created by zhangjirui on 2/3/16.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#include <iostream>
#include <time.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        // add for test
//        long array[7] = {0, 0, 0, 0, 0, 0};
//        
//        time_t seed = time(NULL);
//        srandom(seed);
//        
//        for (int i = 0; i < 1000000; i ++) {
//            int temp = 1 + random() % 6;
//            array[temp] = array[temp] + 1;
//        }
        
        
//        long instantIncome = 0;
//        long ruleMaxBetMoney = 500000;
//        
//        long baseMoney = 200;
//        
//        long betMoney = 0;
//        long maxBetMoney = 0;
//        BOOL newRound = true;
//        
//        long nWin = 0;
//        long nLoose = 0;
        
        long finalIncome = 0;
        
        for (int j = 0; j < 365; j ++) {
            NSLog(@"");
            NSLog(@"Day%d", j+1);
            
            long instantIncome = 0;
            long ruleMaxBetMoney = 500000;
            
            long baseMoney = 500;
            
            long betMoney = 0;
            long maxBetMoney = 0;
            BOOL newRound = true;
            
            long nWin = 0;
            long nLoose = 0;
            
            
            time_t seed = time(NULL);
            srandom(seed);
            for (int i = 0; i < 1000; i++) {
                // bet
                if (newRound) {
                    betMoney = baseMoney;
                } else {
                    betMoney = betMoney * 2;
                }
                if (betMoney > ruleMaxBetMoney) {
                    betMoney = baseMoney;
                }
                
                if (betMoney > maxBetMoney) {
                    maxBetMoney = betMoney;
                }
                instantIncome = instantIncome - betMoney;
                
                int f1 = 1 + random() % 6;
                int f2 = 1 + random() % 6;
                int f3 = 1 + random() % 6;
                
                BOOL bWin = true;
                if ((f1 == f2) && (f2 == f3)) {
                    bWin = false;
                    newRound = false;
                    
                    nLoose = nLoose + 1;
                } else {
                    // bet big
                    if ((f1 + f2 + f3) >= 11) {
                        instantIncome = instantIncome + betMoney * 2;
                        bWin = true;
                        newRound = true;
                        
                        nWin = nWin + 1;
                    } else {
                        bWin = false;
                        newRound = false;
                        
                        nLoose = nLoose + 1;
                    }
                }
                
    //            NSLog(@"%d %d %d -> %d \tbetM:%ld \tinstantM:%ld", f1, f2, f3, bWin, betMoney, instantIncome);
                
            }
            
            NSLog(@"finalIncome -> %ld", instantIncome);
            NSLog(@"maxBetMoney -> %ld", maxBetMoney);
            NSLog(@"nWin:%ld, nLose:%ld", nWin, nLoose);
            
            finalIncome = finalIncome + instantIncome;
            
            sleep(1);
        
        }
        
        NSLog(@" ");
        NSLog(@"FinalIncome %ld", finalIncome);
    }
    return 0;
}


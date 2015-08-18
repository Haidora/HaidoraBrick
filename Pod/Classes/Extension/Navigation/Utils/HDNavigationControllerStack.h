//
//  HDNavigationControllerStack.h
//  Pods
//
//  Created by mrdaios on 15/8/18.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HDViewModelServices;

/**
 *  管理UINavigationController stack和ViewController之间的切换
 */
@interface HDNavigationControllerStack : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *navigationControllers;

+ (instancetype)sharedInstance;

- (void)pushNavigationController:(UINavigationController *)navigationController;
- (UINavigationController *)popNavigationController;
- (UINavigationController *)topNavigationController;

@end
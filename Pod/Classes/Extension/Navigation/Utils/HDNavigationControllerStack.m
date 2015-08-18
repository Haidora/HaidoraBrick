//
//  HDNavigationControllerStack.m
//  Pods
//
//  Created by mrdaios on 15/8/18.
//
//

#import "HDNavigationControllerStack.h"

static HDNavigationControllerStack *_sharedInstance = nil;

@interface HDNavigationControllerStack ()

@property (nonatomic, strong, readwrite) NSMutableArray *navigationControllers;

@end

@implementation HDNavigationControllerStack

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      _sharedInstance = [[super alloc] init];
    });
    return _sharedInstance;
}

- (void)pushNavigationController:(UINavigationController *)navigationController
{
    if ([self.navigationControllers containsObject:navigationController])
        return;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController
{
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}

- (UINavigationController *)topNavigationController
{
    return self.navigationControllers.lastObject;
}

#pragma mark
#pragma mark Getter

- (NSMutableArray *)navigationControllers
{
    if (nil == _navigationControllers)
    {
        _navigationControllers = [[NSMutableArray alloc] init];
    }
    return _navigationControllers;
}

@end

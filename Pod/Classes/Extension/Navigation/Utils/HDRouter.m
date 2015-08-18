//
//  HDRouter.m
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import "HDRouter.h"
#import "HDViewProtocol.h"

static HDRouter *_sharedInstance = nil;

@interface HDRouter ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *viewModelViewMappings;

@end

@implementation HDRouter

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      _sharedInstance = [[super alloc] init];
    });
    return _sharedInstance;
}

- (id<HDViewProtocol>)viewControllerForViewModel:(id<HDViewModelProtocol>)viewModel
{
    NSString *viewModelName = NSStringFromClass(((NSObject *)viewModel).class);
    NSString *viewControllerName = [self.viewModelViewMappings valueForKey:viewModelName];
    if (nil == viewControllerName || !(viewControllerName.length > 0))
    {
        static NSString *ViewModel = @"VideModel";
        static NSString *ViewController = @"ViewController";
        if ([viewModelName hasSuffix:@"ViewModel"])
        {
            NSRange range =
                NSMakeRange((viewModelName.length - ViewModel.length), ViewModel.length);
            viewControllerName =
                [viewModelName stringByReplacingCharactersInRange:range withString:ViewController];

            // update config
            [self.viewModelViewMappings setValue:viewControllerName forKey:viewModelName];
        }
    }
    NSParameterAssert(
        [NSClassFromString(viewControllerName) conformsToProtocol:@protocol(HDViewProtocol)]);
    return [[NSClassFromString(viewControllerName) alloc] initWithViewModel:viewModel];
}

#pragma mark
#pragma mark Getter

- (NSMutableDictionary *)viewModelViewMappings
{
    if (nil == _viewModelViewMappings)
    {
        _viewModelViewMappings = [[NSMutableDictionary alloc] init];
    }
    return _viewModelViewMappings;
}

@end

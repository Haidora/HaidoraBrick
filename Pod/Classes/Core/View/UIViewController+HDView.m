//
//  UIViewController+HDView.m
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import "UIViewController+HDView.h"
#import "NSObject+HDViewModel.h"
#import <objc/runtime.h>

static char *kHD_UIViewController_viewModel = "kHD_UIViewController_viewModel";

@interface UIViewController (HDViewPrivate)

@property (strong, nonatomic, readwrite) id<HDViewModelProtocol> viewModel;

@end

@implementation UIViewController (HDView)

@dynamic viewModel;

- (instancetype)initWithViewModel:(id<HDViewModelProtocol>)viewModel
{
    self = [self init];
    if (self)
    {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark
#pragma mark Getter/Setter

- (void)setViewModel:(id<HDViewModelProtocol>)viewModel
{
    objc_setAssociatedObject(self, kHD_UIViewController_viewModel, viewModel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<HDViewModelProtocol>)viewModel
{
    id result = objc_getAssociatedObject(self, kHD_UIViewController_viewModel);
    if (!result)
    {
        NSString *viewModelName;
        NSString *viewControllerName = NSStringFromClass([self class]);
        if (nil != viewControllerName || (viewControllerName.length > 0))
        {
            static NSString *ViewModel = @"ViewModel";
            static NSString *ViewController = @"ViewController";
            if ([viewControllerName hasSuffix:ViewController])
            {
                NSRange range = NSMakeRange((viewControllerName.length - ViewController.length),
                                            ViewController.length);
                viewModelName = [viewControllerName stringByReplacingCharactersInRange:range
                                                                            withString:ViewModel];
                Class viewModelClass = NSClassFromString(viewModelName);
                if (viewModelClass)
                {
                    result = [[viewModelClass alloc] initWithServices:nil params:nil];
                    if (result)
                    {
                        [self setViewModel:result];
                    }
                }
            }
        }
        if (!result)
        {
            NSAssert(NO, @"HaidoraBrick not found %@ for %@", viewModelName, viewControllerName);
        }
    }
    return result;
}

@end

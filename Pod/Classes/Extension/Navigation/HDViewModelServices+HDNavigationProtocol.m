//
//  HDViewModelServices+HDNavigationProtocol.m
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import "HDViewModelServices+HDNavigationProtocol.h"
#import "HDNavigationControllerStack.h"
#import "HDRouter.h"

@implementation HDViewModelServices (HDNavigationProtocol)

- (void)pushViewModel:(id<HDViewModelProtocol>)viewModel animated:(BOOL)animated
{
    UIViewController *viewController =
        (UIViewController *)[[HDRouter sharedInstance] viewControllerForViewModel:viewModel];
    [[HDNavigationControllerStack sharedInstance]
            .navigationControllers.lastObject pushViewController:viewController
                                                        animated:animated];
}

- (void)popViewModelAnimated:(BOOL)animated
{
    [[HDNavigationControllerStack sharedInstance]
            .navigationControllers.lastObject popViewControllerAnimated:animated];
}

- (void)popToRootViewModelAnimated:(BOOL)animated
{
    [[HDNavigationControllerStack sharedInstance]
            .navigationControllers.lastObject popToRootViewControllerAnimated:animated];
}

- (void)presentViewModel:(id<HDViewModelProtocol>)viewModel
                animated:(BOOL)animated
              completion:(void (^)())completion
{
    UIViewController *viewController =
        (UIViewController *)[[HDRouter sharedInstance] viewControllerForViewModel:viewModel];

    UINavigationController *presentingViewController =
        [HDNavigationControllerStack sharedInstance].navigationControllers.lastObject;
    if (![viewController isKindOfClass:UINavigationController.class])
    {
        viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    [[HDNavigationControllerStack sharedInstance]
        pushNavigationController:(UINavigationController *)viewController];

    [presentingViewController presentViewController:viewController
                                           animated:animated
                                         completion:completion];
}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^)())completion
{
    [[HDNavigationControllerStack sharedInstance] popNavigationController];
    [[HDNavigationControllerStack sharedInstance]
            .navigationControllers.lastObject dismissViewControllerAnimated:animated
                                                                 completion:completion];
}

- (void)resetRootViewModel:(id<HDViewModelProtocol>)viewModel
{
    UIViewController *viewController =
        (UIViewController *)[[HDRouter sharedInstance] viewControllerForViewModel:viewModel];

    if (![viewController isKindOfClass:UINavigationController.class])
    {
        viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    [[HDNavigationControllerStack sharedInstance].navigationControllers removeAllObjects];
    [[HDNavigationControllerStack sharedInstance]
        pushNavigationController:(UINavigationController *)viewController];

    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.rootViewController = viewController;
}

@end

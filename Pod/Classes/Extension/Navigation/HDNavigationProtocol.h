//
//  HDNavigationProtocol.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//
//

@protocol HDViewModelProtocol;

/**
 *  UINavigation方法对应
 */
@protocol HDNavigationProtocol <NSObject>

- (void)pushViewModel:(id<HDViewModelProtocol>)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)presentViewModel:(id<HDViewModelProtocol>)viewModel
                animated:(BOOL)animated
              completion:(void (^)())completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^)())completion;
- (void)resetRootViewModel:(id<HDViewModelProtocol>)viewModel;

@end
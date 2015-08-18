//
//  UIViewController+HDView.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import <UIKit/UIKit.h>
#import "HDViewProtocol.h"

@interface UIViewController (HDView) <HDViewProtocol>

/**
 *  View中引入ViewModel,可默认加载(xxxViewController->xxxViewModel)
 *
 *  1.在ViewController中可以通过类型强转 (xxxViewModel *)self.viewModel;
 *  或者
    2.@property (strong, nonatomic) xxxViewModel *viewModel;
 *  @dynamic viewModel;
 */
@property (strong, nonatomic, readonly) id<HDViewModelProtocol> viewModel;

/**
 *  View层的构造方法
 *
 *  @param viewModel 可传空,可自动加载对应的VideModel
 *
 *  @return
 */
- (instancetype)initWithViewModel:(id<HDViewModelProtocol>)viewModel
    __attribute__((objc_requires_super));

@end

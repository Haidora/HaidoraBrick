//
//  HDViewProtocol.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

@class HDViewModelProtocol;

@protocol HDViewModelProtocol;

/**
 *  @brief View层.
 *
 *  1.定义View层和ViewModel之间的关系
 */
@protocol HDViewProtocol <NSObject>

/**
 *  View层中引入ViewModel.
 */
@property (strong, nonatomic, readonly) id<HDViewModelProtocol> viewModel;

/**
 *  View层的构造方法
 *
 *  @param viewModel
 *
 *  @return
 */
- (instancetype)initWithViewModel:(id<HDViewModelProtocol>)viewModel;

@end
//
//  HDViewModelProtocol.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

@class HDViewModelServices;

/**
 *  @brief ViewModel
 */
@protocol HDViewModelProtocol <NSObject>

/**
 *  用于关联ViewModel和服务之间的关系.
 */
@property (nonatomic, strong, readonly) HDViewModelServices *services;

/**
 *  创建ViewModel时的参数.
 */
@property (nonatomic, strong, readonly) id params;

- (instancetype)initWithServices:(HDViewModelServices *)services params:(id)params;

@end
